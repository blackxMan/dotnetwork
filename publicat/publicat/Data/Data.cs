using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace publicat.Data
{

    public class Data
    {

        public static string ConnnectionStr = "Database=journal;Data Source=localhost;User Id=root;Password=";
        public static MySqlConnection Connection;
        public static void connecter()
        {
            Connection = new MySqlConnection();
            Connection.ConnectionString = ConnnectionStr;
        }
        public static DataTable getAuteurs()
        {                                 
            Data.connecter();
            Data.Connection.Open();
            string MySQLCmd = "SELECT * FROM auteur";
            MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);            
            MySqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            Data.Connection.Close();
            return dt;
        }
        public static DataTable getArticles()
        {            
            Data.connecter();
            Data.Connection.Open();
            string MySQLCmd = "SELECT a.*, count(p.id_aut) as somme, t.* FROM article a, publie p, auteur au, theme t where t.id=a.id_th and a.id = p.id_article and p.id_aut = au.id group by p.id_article";
            MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
            MySqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            dt.Columns.Add("principale", typeof(string));           
            for (int i = 0; i < dt.Rows.Count;i++ )
            {
                dt.Rows[i]["principale"] = getAuteurPrincipal(int.Parse(dt.Rows[i]["id"].ToString()));
            }
            Data.Connection.Close();
            return dt;
        }

        public static DataTable getArticlesByThemes(string libelle)
        {
            Data.connecter();
            Data.Connection.Open();
            string MySQLCmd = "SELECT * FROM theme t, article a where a.id_th = t.id and t.libelle = ?libelle";
            MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
            cmd.Parameters.AddWithValue("?libelle", libelle);
            MySqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            Data.Connection.Close();
            return dt;
        }
        public static string getAuteurPrincipal(int idArticle)
        {
            Data.connecter();
            Data.Connection.Open();
            string MySQLCmd = "SELECT concat(nom_aut,' ',prenom_aut) as nom FROM  publie p, auteur au where p.id_aut = au.id and p.id_article = ?idarticle and p.principale = 1";
            MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
            cmd.Parameters.AddWithValue("?idarticle",idArticle);
            MySqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            Data.Connection.Close();
            return dt.Rows[0]["nom"].ToString();
        }
        
        public static DataTable getThemes()
        {           
            Data.connecter();
            Data.Connection.Open();
            string MySQLCmd = "SELECT * FROM theme";
            MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
            MySqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            Data.Connection.Close();
            return dt;
        }
        public static int getIdAuteurByName(String nom)
        {
            Data.connecter();
            Data.Connection.Open();            
            string MySQLCmd = "SELECT id FROM auteur where concat(nom_aut,' ',prenom_aut)=?nom";
            MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
            cmd.Parameters.AddWithValue("?nom", nom);
            MySqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            int i = rdr.GetInt32(0);
            Data.Connection.Close();
            return i;
        }
        public static DataTable getCorrecteurs()
        {           
            Data.connecter();
            Data.Connection.Open();
            string MySQLCmd = "SELECT * FROM correcteur";
            MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
            MySqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            Data.Connection.Close();
            return dt;
        }
        public static bool addAuteur(string nom, string prenom, string email, string mdp, int id = -1)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                if (id < 0) { MySQLCmd = "insert into auteur(nom_aut, prenom_aut, email_aut, mdp_aut) values(?nom, ?prenom, ?email, ?mdp)"; }
                else { MySQLCmd = "UPDATE `auteur` SET `MDP_AUT` = ?mdp, `NOM_AUT` = ?nom, `PRENOM_AUT` = ?prenom, `EMAIL_AUT` = ?email WHERE `ID` = ?id;"; }
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                if (id > 0) cmd.Parameters.AddWithValue("?id", id);
                cmd.Parameters.AddWithValue("?nom", nom);
                cmd.Parameters.AddWithValue("?prenom", prenom);
                cmd.Parameters.AddWithValue("?email", email);
                cmd.Parameters.AddWithValue("?mdp", mdp);
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();
                return true;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return false;
            }
        }
        public static bool addTheme(string libelle, int id = -1)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                if (id < 0) MySQLCmd = "insert into theme(libelle) values(?libelle)";
                else MySQLCmd = "update theme set libelle = ?libelle where id = ?id";
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                
                cmd.Parameters.AddWithValue("?libelle", libelle);
                if (id > 0) { cmd.Parameters.AddWithValue("?id", (int)id); }
                Data.Connection.Open();
                
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();
               
                return true;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return false;
            }
        }
        public static bool addCorrecteur(string nom, string prenom, string email, string mdp, int id = -1)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                if (id < 0) MySQLCmd = "INSERT INTO `correcteur` (`PRENOM_CORR`, `NOM_CORR`, `EMAIL_CORR`, `mdp`) VALUES (?prenom, ?nom, ?email, ?mdp);";
                else MySQLCmd = "UPDATE `journal`.`correcteur` SET `PRENOM_CORR` = ?prenom, `NOM_CORR` = ?nom, `EMAIL_CORR` = ?email, `mdp` = ?mdp WHERE `correcteur`.`ID` = ?id;";
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                if (id > 0) cmd.Parameters.AddWithValue("?id", id);
                cmd.Parameters.AddWithValue("?nom", nom);
                cmd.Parameters.AddWithValue("?prenom", prenom);
                cmd.Parameters.AddWithValue("?email", email);
                cmd.Parameters.AddWithValue("?mdp", mdp);
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();
                return true;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return false;
            }
        }
        public static long addArticle(string description, string titre, string document, int id_theme, int id = -1)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                if (id < 0) MySQLCmd = "INSERT INTO `article` ( `ID_TH`, `DATE_CREATION`, `DATE_MODIFICATION`, `TITRE`, `DESCIPTION`, `document`, `etat`) VALUES (?id_theme, now(), now(), ?titre, ?description, ?document, 0);";
                else MySQLCmd = "update article set description = ?description, titre = ?titre where id = ?id";
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                if (id > 0) { cmd.Parameters.AddWithValue("?id", id); }
                cmd.Parameters.AddWithValue("?description", description);
                cmd.Parameters.AddWithValue("?titre", titre);          
                cmd.Parameters.AddWithValue("?id_theme", id_theme);
                cmd.Parameters.AddWithValue("?document", document);
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();
                long last = cmd.LastInsertedId;
                return last;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return -1;
            }
        }
        public static bool addPrincipale(long id_arti, int id_aut)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                MySQLCmd = "insert into publie(id_aut, id_article, principale) values(?id_aut, ?id_article, ?princ)";
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("?id_aut", id_aut);
                cmd.Parameters.AddWithValue("?id_article", id_arti);
                cmd.Parameters.AddWithValue("?princ", 1);
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();

                return true;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return false;
            }
        }
        public static bool addPublie(string description, string titre, string document, int id_theme, string auteurs, int principale)
        {
            long idArticle = addArticle(description, titre, document, id_theme);
            addPrincipale(idArticle, principale);
            string[] auteur = auteurs.Split(',');
            Console.WriteLine(auteur.Length);
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                foreach (string aut in auteur)
                {
                    MySQLCmd = "insert into publie(id_aut, id_article, principale) values(?id_aut, ?id_article, ?princ)";
                    MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("?id_aut", getIdAuteurByName(aut));
                    cmd.Parameters.AddWithValue("?id_article", idArticle);
                    cmd.Parameters.AddWithValue("?princ", 0);
                    Data.Connection.Open();
                    int result = cmd.ExecuteNonQuery();
                    Data.Connection.Close();
                }
                
                return true;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return false;
            }
        }
        public static bool corrigeArticle(int idArticle, string justification, int etat, int id_Corr, int id_Article)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                MySQLCmd = "update article set justification = ?just, etat = ?etat, id_corr = ?id_corr where id = ?id";
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("?id", id_Article);
                cmd.Parameters.AddWithValue("?just", justification);
                cmd.Parameters.AddWithValue("?etat", etat);
                cmd.Parameters.AddWithValue("?id_corr", id_Corr);
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();                
                Data.Connection.Close();
                return true;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return false;
            }
        }

        public static bool supprimer(string table, int id)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                MySQLCmd = "delete from "+table+" where id = ?id";
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("?id", id);                
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();
                return true;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return false;
            }
        }
    }

}