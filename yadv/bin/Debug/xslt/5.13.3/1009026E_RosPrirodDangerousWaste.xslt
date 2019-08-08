<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:dngwst="urn:customs.ru:Information:SQDocuments:RosPrirodDangerousWaste:5.11.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:sq_cat="urn:customs.ru:Information:SQDocuments:SQCommonAgregateTypesCust:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="dngwst:RosPrirodDangerousWaste">
      <html>
         <head>
            <title>Заключение (разрешительный документ) на ввоз и (или) вывоз опасных отходов</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					max-width: 210mm;
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
					max-width: 297mm;
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
					font-family: Arial, serif;
					font-size: 10pt;
					vertical-align:top;
				}

				th {
					border: 1px solid gray;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Заключение (разрешительный документ) на ввоз и (или) вывоз опасных отходов</h2>
               <p class="remark">
                  <xsl:choose>
                     <xsl:when test="dngwst:IsCanceled='true' or dngwst:IsCanceled='t' or dngwst:IsCanceled='1' ">Документ не действителен</xsl:when>
                     <xsl:otherwise>Документ действителен</xsl:otherwise>
                  </xsl:choose>
               </p>
               <div style="margin-bottom: 15px;">
                  <span class="header">Id документа</span>
                  <span>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="dngwst:DocumentId"/>
                  </span>
               </div>
               <div style="margin-bottom: 15px;">
                  <span class="header">Заключение</span>
                  <br/>
                  <xsl:apply-templates select="dngwst:Conclusion"/>
               </div>
               <div style="margin-bottom: 15px;">
                  <span class="header">Получатель заключения</span>
                  <br/>
                  <xsl:apply-templates select="dngwst:Receiver"/>
               </div>
               <xsl:if test="dngwst:Object">
                  <div class="header">Перечень отходов</div>
                  <table border="1" width="100%" style="word-break: break-all">
					<col width="30%" valign="top"/>
					<col width="10%" valign="top"/>
					<col width="10%" valign="top"/>
					<col width="10%" valign="top"/>
					<col width="10%" valign="top"/>
					<col width="10%" valign="top"/>
					<col width="10%" valign="top"/>
					<col width="10%" valign="top"/>
                     <tbody>
                        <tr>
                           <xsl:if test="dngwst:Object/dngwst:Name">
                              <th>Наименование</th>
                           </xsl:if>
                           <xsl:if test="dngwst:Object/dngwst:TNVED">
                              <th>Код<br/>ТН ВЭД<br/>ЕАЭС</th>
                           </xsl:if>
                           <xsl:if test="dngwst:Object/dngwst:Numeric">
                              <th>Номер<br/>позиции</th>
                           </xsl:if>
                           <xsl:if test="dngwst:Object/dngwst:FKKO">
                              <th>Код<br/>ФККО</th>
                           </xsl:if>
                           <xsl:if test="dngwst:Object/dngwst:ExportCountry">
                              <th>Экспортер</th>
                           </xsl:if>
                           <xsl:if test="dngwst:Object/dngwst:ImportCountry">
                              <th>Импортер</th>
                           </xsl:if>
                           <xsl:if test="dngwst:Object/dngwst:Count">
                              <th>Коли-<br/>чество</th>
                           </xsl:if>
                           <xsl:if test="dngwst:Object/dngwst:Contract">
                              <th>Контракт</th>
                           </xsl:if>
                        </tr>
                        <xsl:for-each select="dngwst:Object">
                           <tr>
                              <xsl:if test="../dngwst:Object/dngwst:Name">
                                 <td>
                                    <xsl:for-each select="dngwst:Name">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                                    </xsl:for-each>
                                 </td>
                              </xsl:if>
                              <xsl:if test="../dngwst:Object/dngwst:TNVED">
                                 <td>
                                    <xsl:value-of select="dngwst:TNVED"/>
                                 </td>
                              </xsl:if>
                              <xsl:if test="../dngwst:Object/dngwst:Numeric">
                                 <td>
                                    <xsl:value-of select="dngwst:Numeric"/>
                                 </td>
                              </xsl:if>
                              <xsl:if test="../dngwst:Object/dngwst:FKKO">
                                 <td>
                                    <xsl:value-of select="dngwst:FKKO"/>
                                 </td>
                              </xsl:if>
                              <xsl:if test="../dngwst:Object/dngwst:ExportCountry">
                                 <td>
                                    <xsl:value-of select="dngwst:ExportCountry"/>
                                 </td>
                              </xsl:if>
                              <xsl:if test="../dngwst:Object/dngwst:ImportCountry">
                                 <td>
                                    <xsl:value-of select="dngwst:ImportCountry"/>
                                 </td>
                              </xsl:if>
                              <xsl:if test="../dngwst:Object/dngwst:Count">
                                 <td>
                                    <xsl:apply-templates select="dngwst:Count"/>
                                 </td>
                              </xsl:if>
                              <xsl:if test="../dngwst:Object/dngwst:Contract">
                                 <td>
                                    <xsl:apply-templates select="dngwst:Contract"/>
                                 </td>
                              </xsl:if>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <div style="margin-bottom: 15px;">
                  <span class="header">Номер бланка</span>
                  <br/>
                  <xsl:value-of select="dngwst:BlankNumber"/>
               </div>
               <div style="margin-bottom: 15px;">
                  <span class="header">Особые условия</span>
                  <br/>
                  <xsl:apply-templates select="dngwst:SpecialConditions"/>
               </div>
               <xsl:apply-templates select="dngwst:AuthorizedPerson"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="dngwst:Conclusion | dngwst:Contract">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <br/>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
      <xsl:if test="sq_cat:DateTo">
         <span>Документ действителен до </span>
         <xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="sq_cat:DateTo"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <!--xsl:if test="sq_cat:ConclusionType">
         <span>
			Тип заключения: 
			<xsl:value-of select="sq_cat:ConclusionType"/>
         </span>
      </xsl:if-->
   </xsl:template>
   <xsl:template match="dngwst:Receiver">
      <xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if>
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
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
      <span class="header">Адрес:</span>
      <br/>
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
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="dngwst:AuthorizedPerson">
      <br/>
	Уполномоченное должностное лицо, подписавшее заключение: 
	<span style="text-decoration:underline">
         <xsl:value-of select="."/>
      </span>
   </xsl:template>
   <xsl:template match="dngwst:Count">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
</xsl:stylesheet>
