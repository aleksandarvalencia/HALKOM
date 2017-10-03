/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projects.halkom.service;
//import com.projects.halkom.model.ComboValues;
import com.projects.halkom.model.Accounts;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;
//import java.util.ArrayList;
//import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
//import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
//import org.springframework.jdbc.core.namedparam.SqlParameterSource;
//import org.springframework.jdbc.support.GeneratedKeyHolder;
//import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.SqlOutParameter;
/*import org.springframework.util.StringUtils;
import org.springframework.beans.factory.annotation.Required;*/

/*import com.projects.trade.model.User;
import com.projects.trade.model.LoginUser;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;*/
import com.projects.halkom.model.JsTreeNode;
//import com.projects.halkom.model.Programs;
//import com.projects.halkom.model.AdministrationPrograms;
import com.projects.halkom.model.Clients;
import com.projects.halkom.model.ComboValues;
import com.projects.halkom.model.Files;
import com.projects.halkom.model.ProductCodes;
import com.projects.halkom.model.Products;
import java.sql.Types;
//import java.util.ArrayList;
//import org.hibernate.jpa.criteria.predicate.IsEmptyPredicate;
//import org.springframework.util.StringUtils;

@Repository
public class DataServiceImpl implements  DataService {
    
        @Autowired
        private DataSource dataSource;
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
      
        
        @Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) throws DataAccessException {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
        
      
         @Override
	public List<JsTreeNode> getTreeView()  throws RuntimeException
        {
                String PROC_NAME="SGMainDB.dbo.GetMenuGroups_Spring";
            
                SqlParameter usrid = new SqlParameter("UserID", Types.INTEGER);
                SqlOutParameter retval = new SqlOutParameter("RetVal", Types.INTEGER);
                SqlParameter[] paramArray = {usrid,retval};

                StoredProcedureCall spc=new StoredProcedureCall(dataSource, PROC_NAME, paramArray);
                Object [] param_values={2037};
                List<JsTreeNode> result = spc.get(param_values);
                
		return result;

	}
        
        
        
        @Override
        public List<Clients> allClients()
        {
                String sql = "SELECT c.idClient, c.ime, c.client, c.opis, c.NBSAccount, c.status, international FROM tblClients c where 1=2 ORDER BY c.client";
		List<Clients> result = namedParameterJdbcTemplate.query(sql,new ClientsMapper());

		return result;
        
        }
        
        @Override
        public List<Products> allProducts()
        {
                String sql = "SELECT f.idProduct,f.PRODUCTCODE,PRODUCTNAME FROM tblProducts f  ORDER BY f.PRODUCTCODE";
		List<Products> result = namedParameterJdbcTemplate.query(sql,new ProductMapper());

		return result;
        
        }
        
        
        @Override
        public List<Files> allFiles(String p_datum) throws RuntimeException
        {
                
               
                Map<String, Object> params = new HashMap<>();
		params.put("p_datum", p_datum);
                String sql = "select idFile,fileReference,fileType,to_char(fileDate,'DD.MM.YYYY hh:mi:ss') as fileDate, FileName from tblFiles where to_char(fileDate,'DD.MM.YYYY')=:p_datum and FileType='NA' order by fileReference";
		List<Files> result = namedParameterJdbcTemplate.query(sql,params,new FileViewMapper());

		return result;
        
        }
        
        @Override
        public Clients findClientById(Integer id)
        {
            
                Map<String, Object> params = new HashMap<>();
		params.put("id", id);

		String sql = "select c.idClient, c.ime, c.client, c.opis, c.NBSAccount, c.status, international FROM tblClients c WHERE idClient=:id";

		Clients result = null;
		try {
			result = namedParameterJdbcTemplate.queryForObject(sql, params, new ClientsMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		return result;
        }
        @Override
        public String findClientNameByRoot(String root)
        {
        
                Map<String, Object> params = new HashMap<>();
		params.put("root", root);

		String sql = "select nvl(name,'') as ime from client@tms where num=:root";

		Clients result = null;
		try {
			result = namedParameterJdbcTemplate.queryForObject(sql, params, new ClientsMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		return result.getClientName();  
        
        }
        
        @Override
        public Products findProductById(Integer id)
        {
            
                Map<String, Object> params = new HashMap<>();
		params.put("id", id);

		String sql = "select f.idProduct,f.PRODUCTCODE,PRODUCTNAME FROM tblProducts f  WHERE  idProduct=:id";

		Products result = null;
		try {
			result = namedParameterJdbcTemplate.queryForObject(sql, params, new ProductMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		return result;
        }
        @Override
	public List<Clients> executeProcClient(String p_akcija, String p_idClient,String p_client,
                String p_nbsAccount,Integer p_status,Integer p_international, String p_ime,String p_opis)
        {

                String PROC_NAME="HALCOM.spClients";

                SqlParameter akcija = new SqlParameter("p_akcija", Types.VARCHAR);
                SqlParameter idclient = new SqlParameter("p_idClient", Types.INTEGER);
                SqlParameter client = new SqlParameter("p_client", Types.VARCHAR);
                SqlParameter nbs = new SqlParameter("p_nbsAccount", Types.VARCHAR);
                SqlParameter status = new SqlParameter("p_status", Types.CHAR);
                SqlParameter international = new SqlParameter("p_international", Types.INTEGER);
                SqlParameter ime = new SqlParameter("p_ime", Types.VARCHAR);
                SqlParameter opis = new SqlParameter("p_opis", Types.VARCHAR);
                SqlOutParameter rst = new SqlOutParameter("p_table", OracleTypes.CURSOR, new ClientsMapper());
                
                SqlParameter[] paramArray = {akcija,idclient,client,nbs,status,international,ime,opis,rst};

                StoredProcedureCall spc=new StoredProcedureCall(dataSource, PROC_NAME, paramArray);
                Object [] param_values={p_akcija,p_idClient,p_client,p_nbsAccount,p_status,p_international,p_ime,p_opis};
                Map res=spc.executeProc(param_values);
                List<Clients> result = (List<Clients>) res.get("p_table");
                
                return result;

	}
        
        @Override
	public List<Files> executeProcFiles(String p_akcija, Integer p_idfile, Integer p_idna)
        {

                String PROC_NAME="HALCOM.spFiles";

                SqlParameter akcija = new SqlParameter("p_akcija", Types.VARCHAR);
                SqlParameter file = new SqlParameter("p_idfile", Types.INTEGER);
                SqlParameter na = new SqlParameter("p_idna", Types.INTEGER);
                SqlOutParameter rst = new SqlOutParameter("p_table", OracleTypes.CURSOR, new FilesMapper());
                
                SqlParameter[] paramArray = {akcija,file,na,rst};

                StoredProcedureCall spc=new StoredProcedureCall(dataSource, PROC_NAME, paramArray);
                Object [] param_values={p_akcija,p_idfile,p_idna};
                Map res=spc.executeProc(param_values);
                List<Files> result = (List<Files>) res.get("p_table");
                
                return result;

	}
        
        @Override
        public List<ComboValues>  getInternational()  throws RuntimeException
        {
             String PROC_NAME="HALCOM.sp_International";
             String p_akcija="select";
             
                SqlParameter akcija = new SqlParameter("p_akcija", Types.VARCHAR);
                SqlOutParameter rst = new SqlOutParameter("rs", OracleTypes.CURSOR, new ComboValueMapper());
                
                SqlParameter[] paramArray = {akcija,rst};

                StoredProcedureCall spc=new StoredProcedureCall(dataSource, PROC_NAME, paramArray);
                Object [] param_values={p_akcija};
                Map res=spc.executeProc(param_values);
                List<ComboValues> result = (List<ComboValues>) res.get("rs");
                
                return result;
            
        
        }
        @Override
        public List<ComboValues>  getAuthList()  throws RuntimeException
        {
             String PROC_NAME="HALCOM.sp_Auth";
             String p_akcija="select";
             
                SqlParameter akcija = new SqlParameter("p_akcija", Types.VARCHAR);
                SqlOutParameter rst = new SqlOutParameter("rs", OracleTypes.CURSOR, new AccountsMapper());
                
                SqlParameter[] paramArray = {akcija,rst};

                StoredProcedureCall spc=new StoredProcedureCall(dataSource, PROC_NAME, paramArray);
                Object [] param_values={p_akcija};
                Map res=spc.executeProc(param_values);
                List<ComboValues> result = (List<ComboValues>) res.get("rs");
                
                return result;
            
        
        }
        
        
        @Override
        public List<Accounts>  getAccountList(String root,String p_akcija)  throws RuntimeException
        {
             String PROC_NAME="HALCOM.spClients";
            // String p_akcija="accountList";
             
                SqlParameter akcija = new SqlParameter("p_akcija", Types.VARCHAR);
                SqlParameter idclient = new SqlParameter("p_idClient", Types.INTEGER);
                SqlParameter client = new SqlParameter("p_client", Types.VARCHAR);
                SqlParameter nbs = new SqlParameter("p_nbsAccount", Types.VARCHAR);
                SqlParameter status = new SqlParameter("p_status", Types.CHAR);
                SqlParameter international = new SqlParameter("p_international", Types.INTEGER);
                SqlParameter ime = new SqlParameter("p_ime", Types.VARCHAR);
                SqlParameter opis = new SqlParameter("p_opis", Types.VARCHAR);
                SqlOutParameter rst = new SqlOutParameter("rs", OracleTypes.CURSOR, new AccountsMapper());
                
                SqlParameter[] paramArray = {akcija,idclient,client,nbs,status,international,ime,opis,rst};

                StoredProcedureCall spc=new StoredProcedureCall(dataSource, PROC_NAME, paramArray);
                Object [] param_values={p_akcija,null,root,null,null,null,null,null};
                Map res=spc.executeProc(param_values);
                List<Accounts> result = (List<Accounts>) res.get("rs");
                
                return result;
            
        
        }
          @Override
        public List<ProductCodes>  getProductList(Integer product)  throws RuntimeException
        {
                String PROC_NAME="HALCOM.spProducts";
                String p_akcija="productList";
                SqlParameter akcija = new SqlParameter("p_akcija", Types.VARCHAR);
                SqlParameter idproduct = new SqlParameter("p_idproduct", Types.INTEGER);
                SqlParameter productcode = new SqlParameter("p_productcode", Types.VARCHAR);
                SqlParameter productname = new SqlParameter("p_productname", Types.VARCHAR);
                SqlOutParameter rst = new SqlOutParameter("p_table", OracleTypes.CURSOR, new ProductCodesMapper());
                
                SqlParameter[] paramArray = {akcija,idproduct,productcode,productname,rst};

                StoredProcedureCall spc=new StoredProcedureCall(dataSource, PROC_NAME, paramArray);
                Object [] param_values={p_akcija,product,null,null};
                Map res=spc.executeProc(param_values);
                List<ProductCodes> result = (List<ProductCodes>) res.get("p_table");
                
                return result;
            
        
        }
        
        @Override
	public List<Products> executeProcProduct(String p_akcija, Integer p_idProduct,String p_productcode,String p_productname)
        {

                String PROC_NAME="HALCOM.spProducts";

                SqlParameter akcija = new SqlParameter("p_akcija", Types.VARCHAR);
                SqlParameter idproduct = new SqlParameter("p_idproduct", Types.INTEGER);
                SqlParameter productcode = new SqlParameter("p_productcode", Types.VARCHAR);
                SqlParameter productname = new SqlParameter("p_productname", Types.VARCHAR);
                SqlOutParameter rst = new SqlOutParameter("p_table", OracleTypes.CURSOR, new ProductMapper());
                
                SqlParameter[] paramArray = {akcija,idproduct,productcode,productname,rst};

                StoredProcedureCall spc=new StoredProcedureCall(dataSource, PROC_NAME, paramArray);
                Object [] param_values={p_akcija,p_idProduct,p_productcode,p_productname};
                Map res=spc.executeProc(param_values);
                List<Products> result = (List<Products>) res.get("p_table");
                
                return result;

	}
        
       
         private static final class ClientsMapper implements RowMapper<Clients> 
        {

                @Override
		public Clients mapRow(ResultSet rs, int rowNum) throws SQLException 
                {
			Clients client = new Clients();
			client.setInternational(rs.getInt("international"));
                        client.setIdClient(rs.getString("idClient"));
                        client.setStatus(rs.getInt("status"));
                        client.setRoot(rs.getString("client"));
                        client.setOpis(rs.getString("opis"));
			client.setNbsAccount(rs.getString("nbsAccount"));
			client.setClientName(rs.getString("ime"));
                        client.setSearch(0);
			return client;
		}
	}
    
         private static final class AccountsMapper implements RowMapper<Accounts> 
        {

                @Override
		public Accounts mapRow(ResultSet rs, int rowNum) throws SQLException 
                {
			Accounts account = new Accounts();
			account.setName(rs.getString("name"));
                        account.setNbsAccount(rs.getString("nbsAccount"));
                        account.setOpis(rs.getString("description"));
                        account.setCurrency(rs.getString("currency"));
			return account;
		}
	}
        
         
            private static final class ProductMapper implements RowMapper<Products> 
        {

                @Override
		public Products mapRow(ResultSet rs, int rowNum) throws SQLException 
                {
			Products product = new Products();
			product.setIdProduct(rs.getInt("idProduct"));
                        product.setProductCode(rs.getString("PRODUCTCODE"));
                        product.setProductName(rs.getString("PRODUCTNAME"));
			return product;
		}
	}
       
          private static final class ComboValueMapper implements RowMapper<ComboValues> {
                @Override
		public ComboValues mapRow(ResultSet rs, int rowNum) throws SQLException {
			ComboValues cmb = new ComboValues(Integer.parseInt(rs.getString("id")),rs.getString("description"));
			return cmb;
		}
	}
        
       
        private static final class FilesMapper implements RowMapper<Files> 
        {

                @Override
		public Files mapRow(ResultSet rs, int rowNum) throws SQLException 
                {
			Files file = new Files();
			file.setIdFile(rs.getInt("idFile"));
                        file.setIdna(rs.getInt("idNA"));
                        file.setDok(rs.getString("iddok"));
                        file.setPrejem(rs.getString("idprejem"));
                        file.setDatumvalute(rs.getString("datumvalute"));
                        file.setRacund(rs.getString("racund"));
			file.setIznos(rs.getString("iznos"));
			file.setImeb(rs.getString("imeb"));
                        file.setAdresab(rs.getString("adresab"));
                        file.setImed(rs.getString("imed"));
                        file.setAdresad(rs.getString("adresad"));
                        file.setNamen(rs.getString("namen"));
                        file.setDatumprometa(rs.getString("datumprometa"));
			return file;
		}
	}
        
         private static final class FileViewMapper implements RowMapper<Files> 
        {

                @Override
		public Files mapRow(ResultSet rs, int rowNum) throws SQLException 
                {
			Files file = new Files();
			file.setIdFile(rs.getInt("idFile"));
                        file.setFileReference(rs.getString("fileReference"));
                        file.setFileType(rs.getString("fileType"));
                        file.setFileDate(rs.getString("fileDate"));
                        file.setFileName(rs.getString("FileName"));
			return file;
		}
	}
         
           private static final class ProductCodesMapper implements RowMapper<ProductCodes> 
        {

                @Override
		public ProductCodes mapRow(ResultSet rs, int rowNum) throws SQLException 
                {
			ProductCodes account = new ProductCodes();
			account.setProductcode(rs.getString("productcode"));
                        account.setProductname(rs.getString("description"));
			return account;
		}
	}
        
}
