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
        public static DataSet getUtilisateur()
        {
            Data.connecter();
            Data.Connection.Open();
            MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
            string MySQLCmd = "SELECT * FROM auteur";        
            MyAdapter.SelectCommand = new MySqlCommand(MySQLCmd, Data.Connection);
            DataSet ds = new DataSet();
            MyAdapter.Fill(ds);
            Data.Connection.Close();
            return ds;
        }
        public static DataSet getArticles()
        {
            Data.connecter();
            Data.Connection.Open();
            MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
            string MySQLCmd = "SELECT * FROM article";
            MyAdapter.SelectCommand = new MySqlCommand(MySQLCmd, Data.Connection);
            DataSet ds = new DataSet();
            MyAdapter.Fill(ds);
            Data.Connection.Close();
            return ds;
        }
        public static DataSet getTheme()
        {
            Data.connecter();
            Data.Connection.Open();
            MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
            string MySQLCmd = "SELECT * FROM theme";
            MyAdapter.SelectCommand = new MySqlCommand(MySQLCmd, Data.Connection);
            DataSet ds = new DataSet();
            MyAdapter.Fill(ds);
            Data.Connection.Close();
            return ds;
        }
        public static DataSet getCorrecteur()
        {
            Data.connecter();
            Data.Connection.Open();
            MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
            string MySQLCmd = "SELECT * FROM correcteur";
            MyAdapter.SelectCommand = new MySqlCommand(MySQLCmd, Data.Connection);
            DataSet ds = new DataSet();
            MyAdapter.Fill(ds);
            Data.Connection.Close();
            return ds;
        }
        public static bool addAuteur(string nom, string prenom, string email, string mdp, int id = -1)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                if (id < 0) {  MySQLCmd = "insert into auteur(nom, prenom, email, mdp) values(?nom, ?prenom, ?email, ?mdp)"; }
                else { MySQLCmd = "update auteur set nom = ?nom, prenom = ?prenom, email = ?email, mdp = ?mdp) where id = ?id"; }
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                if (id > 0) cmd.Parameters.Add("?id", id);
                cmd.Parameters.Add("?nom", nom);
                cmd.Parameters.Add("?prenom", prenom);
                cmd.Parameters.Add("?email", email);
                cmd.Parameters.Add("?mdp", mdp);
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();
                return true;
            }
            catch (Exception e)
            {
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
                if (id > 0) cmd.Parameters.Add("?id", id);
                cmd.Parameters.Add("?libelle", libelle);             
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public static bool addCorrecteur(string nom, string prenom, string email, string mdp, int id)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                if (id < 0) MySQLCmd = "insert into correcteur(nom, prenom, email, mdp) values(?nom, ?prenom, ?email, ?mdp)";
                else MySQLCmd = "update correcteur set nom = ?nom, prenom = ?prenom, email = ?email, mdp = ?mdp where id = ?id ";
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                if(id > 0) cmd.Parameters.Add("?id", id);
                cmd.Parameters.Add("?nom", nom);
                cmd.Parameters.Add("?prenom", prenom);
                cmd.Parameters.Add("?email", email);
                cmd.Parameters.Add("?mdp", mdp);
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public static long addArticle(string description, string titre, int id)
        {
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                if (id < 0) MySQLCmd = "insert into article(date_creation, date_modification, titre, description) values(now(), now(), ?description, ?mdp)";
                else MySQLCmd = "update article set description = ?description, titre = ?titre where id = ?id";
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                if (id > 0) { cmd.Parameters.Add("?id", id); }
                cmd.Parameters.Add("?description", description);
                cmd.Parameters.Add("?titre", titre);       
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                Data.Connection.Close();
                long last = cmd.LastInsertedId;
                return last;
            }
            catch (Exception e)
            {
                return -1;
            }
        }
        public static long addPublie(string description, string titre, int id)
        {
            long idArticle = addArticle(description, titre, id);
            string MySQLCmd;
            try
            {
                Data.connecter();
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                if (id < 0) MySQLCmd = "insert into article(date_creation, date_modification, titre, description) values(now(), now(), ?description, ?mdp)";
                else MySQLCmd = "update article set description = ?description, titre = ?titre where id = ?id";
                MySqlCommand cmd = new MySqlCommand(MySQLCmd, Data.Connection);
                cmd.CommandType = CommandType.Text;
                if (id > 0) { cmd.Parameters.Add("id", id); }
                cmd.Parameters.Add("?description", description);
                cmd.Parameters.Add("?titre", titre);
                Data.Connection.Open();
                int result = cmd.ExecuteNonQuery();                
                long last = cmd.LastInsertedId;
                Data.Connection.Close();
                return last;
            }
            catch (Exception e)
            {
                return -1;
            }
        }
    }
     
}