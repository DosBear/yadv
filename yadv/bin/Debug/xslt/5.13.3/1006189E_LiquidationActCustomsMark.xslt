<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:lacm="urn:customs.ru:Information:CustomsDocuments:LiquidationActCustomsMark:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="lacm:LiquidationActCustomsMark">
      <html>
         <head>
            <title>Таможенные отметки к акту об уничтожении</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 8pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="right" class="graph" style="border:solid 0pt" width="50%"> </td>
                     <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
                        <xsl:if test="lacm:Customs/cat_ru:OfficeName">
                           <xsl:value-of select="lacm:Customs/cat_ru:OfficeName"/>, </xsl:if>
                        <xsl:value-of select="lacm:Customs/cat_ru:Code"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"/>
                     <td class="graph" style="border:solid 0pt">(наименование таможенного органа (с указанием кода таможенного органа))</td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="graph" colspan="4" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph" colspan="4" style="border:solid 0pt">Акт № <u>
                           <xsl:value-of select="lacm:ActRegNumber/lacm:CustomsCode"/>
                        </u>/ <u>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="lacm:ActRegNumber/lacm:RegistrationDate"/>
                           </xsl:call-template>
                        </u>/ <u>
                           <xsl:value-of select="lacm:ActRegNumber/lacm:SerialNumber"/>
                        </u>АУ<br/>об уничтожении товаров, помещенных под таможенную процедуру СТЗ<br/> и пришедших в негодность, и (или) упаковки</td>
                  </tr>
                  <!--<tr>
					<td style="border:solid 0pt" class="graph" colspan="4" align="center">Разрешение на уничтожение товаров, пришедших в негодность, и (или) упаковки на территории ОЭЗ или вывоз таких товаров и (или) упаковки в целях их уничтожения за пределы территории ОЭЗ, выданное уполномоченным таможенным органом на уничтожение таких твоаров в соответствии с Заявлением на уничтожение № <u><xsl:value-of select="lacm:ActRegNumber/lacm:CustomsCode"/></u>/ <u><xsl:call-template name="russian_date_gtd">
					<xsl:with-param name="dateIn" select="lacm:ActRegNumber/lacm:RegistrationDate"/>
					</xsl:call-template>
					</u>/ <u><xsl:value-of select="lacm:ActRegNumber/lacm:SerialNumber"/></u> ЗУН<br/></td>
				</tr>-->
                  <tr>
                     <td class="graph" colspan="4" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt" width="50%"> </td>
                     <td class="graph" colspan="2" style="border:solid 0pt">
                        <table>
                           <tr>
                              <td class="graph">Отметки таможенного органа<br/>
                                 <table>
                                    <tr>
                                       <td class="graph" style="border:solid 0pt">
                                          <xsl:choose>
                                             <xsl:when test="lacm:CustomsMark='1'">Товар снят с контроля</xsl:when>
                                             <xsl:when test="lacm:CustomsMark='0'">Сведения не соответствуют:
										<xsl:if test="lacm:NeededActions">
                                                   <xsl:value-of select="lacm:NeededActions"/>
                                                </xsl:if>
                                             </xsl:when>
                                          </xsl:choose>
                                       </td>
                                       <td style="border:solid 0pt" width="4%"/>
                                       <td class="graph" style="border:solid 0pt">
                                          <xsl:if test="lacm:CustomsMark='0'">Срок представления акта: 
									<xsl:if test="lacm:ActPresentDate">
                                                <xsl:call-template name="russian_date_gtd1">
                                                   <xsl:with-param name="dateIn" select="lacm:ActPresentDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;" valign="bottom" width="47%">
                                          <br/>
                                          <xsl:call-template name="russian_date_gtd1">
                                             <xsl:with-param name="dateIn" select="lacm:CustomsPerson/cat_ru:IssueDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td style="border:solid 0pt" width="4%"/>
                                       <td align="center" class="graph" style="border:solid 0pt">
                                          <xsl:value-of select="lacm:CustomsPerson/cat_ru:PersonSurname"/> 
									<xsl:value-of select="lacm:CustomsPerson/cat_ru:PersonName"/>
                                          <br/>
                                          <xsl:if test="lacm:CustomsPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="lacm:CustomsPerson/cat_ru:PersonMiddleName"/>
                                          </xsl:if>
                                          <xsl:if test="lacm:CustomsPerson/cat_ru:PersonPost"> (<xsl:value-of select="lacm:CustomsPerson/cat_ru:PersonPost"/>)</xsl:if>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="graph" style="border:solid 0pt">(дата)</td>
                                       <td style="border:solid 0pt" width="4%"/>
                                       <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;">(подпись)</td>
                                    </tr>
                                 </table>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>,
	</xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>,
	</xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>,
	</xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>,
	</xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>,
	</xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>,
	</xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
	Адрес:
	<xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if> 
</xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd1">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>/
				<xsl:value-of select="substring($dateIn,6,2)"/>/
				<xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
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
</xsl:stylesheet>
