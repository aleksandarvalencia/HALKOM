/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projects.halkom.model;

/**
 *
 * @author bd101009
 */
public class Accounts 
{
    String name;
    String nbsAccount;

    public String getNbsAccount() {
        return nbsAccount;
    }

    public void setNbsAccount(String nbsAccount) {
        this.nbsAccount = nbsAccount;
    }
    String opis;
    String currency;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }
    
    
}
