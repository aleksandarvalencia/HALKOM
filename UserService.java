package com.projects.halkom.service;

import com.projects.halkom.model.ComboValues;
import java.util.List;

import com.projects.halkom.model.User;
import com.projects.halkom.model.LoginUser;
import com.projects.halkom.model.JsTreeNode;

public interface UserService {

	User findById(Integer id);
        
        List<JsTreeNode> getTreeView(Integer idAuth);
        
        String DisplayNameByUserName(String username,String password);
        
        LoginUser UserLogin(String username, String password);
	
	List<User> findAll();
        
       List<ComboValues>  getAuthList();

        Integer getidUser() ;
  
	//void userInsert(User user);
        
	//void userUpdate(User user);
        
	//void delete(Integer id);
        //void delete(User user);
        
        Integer getidAuth() ;

        Integer getlogStatus() ;
        void setlogStatus(Integer log);
        
        List<User> executeProcUser(String p_akcija, Integer p_idUser, String p_firstname,String p_secondname,
                String p_username,String p_password,Integer p_idAuth, Integer p_status,Integer p_logged);

	Integer DisplayLogStatusByUserName(String username,String password);
}