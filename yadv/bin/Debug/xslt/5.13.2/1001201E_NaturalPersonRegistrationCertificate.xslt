<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="nprc clt_ru cat_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:nprc="urn:customs.ru:Information:RegistrationDocuments:NaturalPersonRegistrationCertificate:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="nprc:NaturalPersonRegistrationCertificate">
      <html>
         <head>
            <title>
                    СВИДЕТЕЛЬСТВО О ГОСУДАРСТВЕННОЙ РЕГИСТРАЦИИ ФИЗИЧЕСКОГО ЛИЦА В КАЧЕСТВЕ ИНДИВИДУАЛЬНОГО
                    ПРЕДПРИНИМАТЕЛЯ
                </title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    table {
                        border: 0;
                        cellpadding: 3;
                        cellspacing: 0;
                        width: 100%;
                        border-collapse: collapse;
                    }

                    td {
                        font-size: 6.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                        padding-left: 4pt
                    }

                    td.bold {
                        font-size: 8.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: bottom;
                        /*white-space: nowrap;*/
                    }

                    td.value {
                        font-size: 10.0pt;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                    }

                    td.border-top {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: .5pt solid windowtext;
                        border-bottom: medium none;
                    }

                    td.border-bottom {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    span.bold {
                        font-size: 12.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                    }

                    .value {
                        font-size: 12.0pt;
                    }

                    div.page {
                        width: 210mm;
                        height: 297mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: white;
                        border: solid 1pt black;
                    }

                    @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="right" class="value" width="100%">
                                Форма No. │<xsl:value-of select="substring(nprc:FormName,1,1)"/>│<xsl:value-of select="substring(nprc:FormName,2,1)"/>│<xsl:value-of select="substring(nprc:FormName,3,1)"/>│<xsl:value-of select="substring(nprc:FormName,4,1)"/>│<xsl:value-of select="substring(nprc:FormName,5,1)"/>│<xsl:value-of select="substring(nprc:FormName,6,1)"/>│
                            </td>
                  </tr>
               </table>
               <p style="padding-top: 70pt; padding-bottom: 20pt;">
                        СВИДЕТЕЛЬСТВО
                        <br/>
                        О ГОСУДАРСТВЕННОЙ РЕГИСТРАЦИИ ФИЗИЧЕСКОГО ЛИЦА
                        <br/>
                        В КАЧЕСТВЕ ИНДИВИДУАЛЬНОГО ПРЕДПРИНИМАТЕЛЯ
                    </p>
               <p style="text-align: justify; text-indent: 20pt;">
                        Настоящим подтверждается, что в соответствии с Федеральным законом "О
                        государственной регистрации юридических лиц и индивидуальных предпринимателей" в Единый
                        государственный реестр индивидуальных предпринимателей внесена запись о государственной
                        регистрации физического лица в качестве индивидуального предпринимателя
                    </p>
               <table>
                  <tr>
                     <td align="center" class="border-bottom">
                        <span class="value">
                           <xsl:value-of select="nprc:Businessman"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" valign="top" width="100%">(фамилия, имя, отчество)</td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="value" width="50%">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="nprc:RegistrationDate"/>
                        </xsl:call-template>
                     </td>
                     <td class="value" style="width: 50%; white-space: normal;" width="50%">
                                за основным государственным регистрационным номером записи о
                                государственной регистрации индивидуального предпринимателя
                            </td>
                  </tr>
               </table>
               <p>
                  <xsl:value-of select="nprc:RegistrationNumberID"/>
               </p>
               <table>
                  <tr>
                     <td align="center" class="border-bottom">
                        <span class="value">
                           <xsl:value-of select="nprc:RegistrationOrganization"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" valign="top" width="100%">(наименование регистрирующего органа)</td>
                  </tr>
               </table>
               <p/>
               <table>
                  <tr>
                     <td class="value" style="white-space: normal;" width="50%">
                                Должность уполномоченного лица регистрирующего органа:
                                <xsl:value-of select="nprc:DocumentSignature/cat_ru:PersonPost"/>
                     </td>
                     <td align="center" class="value" style="vertical-align: bottom;" width="50%">
                        <xsl:value-of select="nprc:DocumentSignature/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="nprc:DocumentSignature/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="nprc:DocumentSignature/cat_ru:PersonMiddleName"/>
                     </td>
                  </tr>
                  <tr>
                     <td width="50%"/>
                     <td align="center" class="border-top" width="50%">(подпись, Ф.И.О.)
                            </td>
                  </tr>
               </table>
               <p>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
               </p>
               <p align="right">М.П.
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
               </p>
               <br/>
               <p align="right">серия
                    <xsl:value-of select="nprc:Form/nprc:FormSerial"/> № 
					<xsl:value-of select="nprc:Form/nprc:FormNumber"/>
               </p>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
