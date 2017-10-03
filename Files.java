/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projects.halkom.model;

import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

/**
 *
 * @author BD101009
 */
public class Files 
{
     String dok;
     String prejem;
     String datumvalute;
     String racund;
     String iznos;
     String imeb;
     String adresab;
     String imed; 
     String adresad;
     String namen;
     String datumprometa; 
     Integer idFile;
     String fileReference;
     String fileType;
     String fileDate;
     String fileName;
     Integer idna;

    public String getDok() {
        return dok;
    }

    public void setDok(String dok) {
        this.dok = dok;
    }

    public String getPrejem() {
        return prejem;
    }

    public void setPrejem(String prejem) {
        this.prejem = prejem;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getIdna() {
        return idna;
    }

    public void setIdna(Integer idna) {
        this.idna = idna;
    }

    public String getDatumvalute() {
        return datumvalute;
    }

    public void setDatumvalute(String datumvalute) {
        this.datumvalute = datumvalute;
    }

    public String getRacund() {
        return racund;
    }

    public void setRacund(String racund) {
        this.racund = racund;
    }

    public String getIznos() {
        return iznos;
    }

    public void setIznos(String iznos) {
        this.iznos = iznos;
    }

    public String getImeb() {
        return imeb;
    }

    public void setImeb(String imeb) {
        this.imeb = imeb;
    }

    public String getAdresab() {
        return adresab;
    }

    public void setAdresab(String adresab) {
        this.adresab = adresab;
    }

    public String getImed() {
        return imed;
    }

    public void setImed(String imed) {
        this.imed = imed;
    }

    public String getAdresad() {
        return adresad;
    }

    public void setAdresad(String adresad) {
        this.adresad = adresad;
    }

    public String getNamen() {
        return namen;
    }

    public void setNamen(String namen) {
        this.namen = namen;
    }

    public String getDatumprometa() {
        return datumprometa;
    }

    public void setDatumprometa(String datumprometa) {
        this.datumprometa = datumprometa;
    }

    public Integer getIdFile() {
        return idFile;
    }

    public void setIdFile(Integer idFile) {
        this.idFile = idFile;
    }

    public String getFileReference() {
        return fileReference;
    }

    public void setFileReference(String fileReference) {
        this.fileReference = fileReference;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getFileDate() {
        return fileDate;
    }

    public void setFileDate(String fileDate) {
        this.fileDate = fileDate;
    }
   

}
