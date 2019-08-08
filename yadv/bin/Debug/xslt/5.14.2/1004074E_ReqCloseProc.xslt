<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:rcdp="urn:customs.ru:Information:ExchangeDocuments:ReqCloseProc:5.10.0" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="no" media-type="text/html" omit-xml-declaration="no" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head/>
         <body>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:28; font-weight:bold; text-decoration:underline; ">Запрос на закрытие предварительной процедуры / процедуры декларирования</span>
                     </td>
                  </tr>
               </tbody>
            </table>
            <xsl:for-each select="rcdp:ReqCloseProc">
               <table border="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="right" colspan="2">
                           <span style="font-size:13; font-weight:bold; ">Уникальный идентификатор документа</span>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" colspan="2">
                           <xsl:for-each select="cat_ru:DocumentID">
                              <span style="font-size:14; ">
                                 <xsl:apply-templates/>
                              </span>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="right" colspan="2">
                           <span style="font-size:13; font-weight:bold; ">Идентификатор процедуры декларирования</span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="right">
                           <xsl:for-each select="rcdp:CloseProcedureID">
                              <span style="font-size:14; ">
                                 <xsl:apply-templates/>
                              </span>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <span style="font-size:18; font-weight:bold; ">Информация об участнике ВЭД</span>
               <xsl:for-each select="rcdp:Declarant">
                  <table border="1" width="100%">
                     <tbody>
                        <tr>
                           <td height="203">
                              <table border="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td width="20%">Наименование</td>
                                       <td align="left" width="30%">
                                          <xsl:for-each select="cat_ru:ShortName">
                                             <span style="background-color:#C0C0C0; width:100%; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                       <td colspan="3" width="50%">
                                          <xsl:for-each select="cat_ru:OrganizationName">
                                             <span style="background-color:#C0C0C0; width:100 %; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                              <table border="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td width="5%">ИНН</td>
                                       <td width="20%">
                                          <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:INN">
                                             <span style="background-color:#C0C0C0; width:100%; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                       <td width="5%">КПП</td>
                                       <td width="20%">
                                          <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                             <span style="background-color:#C0C0C0; width:100%; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                       <td width="5%">ОГРН</td>
                                       <td width="20%">
                                          <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                             <span style="background-color:#C0C0C0; width:100%; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                       <td width="5%">ОКПО</td>
                                       <td width="20%">
                                          <xsl:for-each select="cat_ru:OKPOID">
                                             <span style="background-color:#C0C0C0; width:100%; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2" width="20%">Местонахождение</td>
                                       <td colspan="6" width="80%">
                                          <xsl:for-each select="cat_ru:Address/cat_ru:StreetHouse">
                                             <span style="background-color:#C0C0C0; width:100%; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                              <table border="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td width="9%">Телефон</td>
                                       <td width="25%">
                                          <xsl:for-each select="cat_ru:Contact/cat_ru:Phone">
                                             <span style="background-color:#C0C0C0; width:100%; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                       <td align="center" width="7%">Факс</td>
                                       <td width="25%">
                                          <xsl:for-each select="cat_ru:Contact/cat_ru:Fax">
                                             <span style="background-color:#C0C0C0; width:100%; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                       <td align="center" width="9%">Телекс</td>
                                       <td width="25%">
                                          <xsl:for-each select="cat_ru:Contact/cat_ru:Telex">
                                             <span style="background-color:#C0C0C0; width:100%; ">
                                                <xsl:apply-templates/>
                                             </span>
                                          </xsl:for-each>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                              <span style="font-weight:bold; ">Адрес</span>
                              <xsl:for-each select="cat_ru:Address">
                                 <table border="0" width="100%">
                                    <tbody>
                                       <tr>
                                          <td width="5%">Код</td>
                                          <td width="10%">
                                             <xsl:for-each select="cat_ru:CountryCode">
                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                   <xsl:apply-templates/>
                                                </span>
                                             </xsl:for-each>
                                          </td>
                                          <td align="center" width="8%">Индекс</td>
                                          <td width="19%">
                                             <xsl:for-each select="cat_ru:PostalCode">
                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                   <xsl:apply-templates/>
                                                </span>
                                             </xsl:for-each>
                                          </td>
                                          <td align="center" width="8%">Город</td>
                                          <td width="50%">
                                             <xsl:for-each select="cat_ru:City">
                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                   <xsl:apply-templates/>
                                                </span>
                                             </xsl:for-each>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan="6">
                                             <xsl:for-each select="cat_ru:StreetHouse">
                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                   <xsl:apply-templates/>
                                                </span>
                                             </xsl:for-each>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </xsl:for-each>
                              <!--span style="font-weight:bold; ">Банковские счета</span>
                                        <xsl:for-each select="cat_ru:BankInformation">
                                            <table border="1" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <table border="0" width="100%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td align="left" width="10%">Банк</td>
                                                                        <td colspan="10">
                                                                            <xsl:for-each select="cat_ru:BankName">
                                                                                <span style="background-color:#C0C0C0; width:100 %; ">
                                                                                    <xsl:apply-templates />
                                                                                </span>
                                                                            </xsl:for-each>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <table border="0" width="100%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td width="10%">Номер</td>
                                                                        <td width="25%">
                                                                            <xsl:for-each select="cat_ru:BankAccount">
                                                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                                                    <xsl:apply-templates />
                                                                                </span>
                                                                            </xsl:for-each>
                                                                        </td>
                                                                        <td align="center" width="5%">Тип</td>
                                                                        <td width="25%">
                                                                            <xsl:for-each select="cat_ru:BankAccountDescription">
                                                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                                                    <xsl:apply-templates />
                                                                                </span>
                                                                            </xsl:for-each>
                                                                        </td>
                                                                        <td align="center" width="15%">МФО банка</td>
                                                                        <td width="20%">
                                                                            <xsl:for-each select="cat_ru:BankMFO">
                                                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                                                    <xsl:apply-templates />
                                                                                </span>
                                                                            </xsl:for-each>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </xsl:for-each-->
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </xsl:for-each>
               <br/>
            </xsl:for-each>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
