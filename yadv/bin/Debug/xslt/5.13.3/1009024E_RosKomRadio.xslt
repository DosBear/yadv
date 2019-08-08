<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rskrad="urn:customs.ru:Information:SQDocuments:RosKomRadio:5.13.3" xmlns:sq_cat="urn:customs.ru:Information:SQDocuments:SQCommonAgregateTypesCust:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="rskrad:RosKomRadio">
      <html>
         <head>
            <title>Заключение (разрешительный документ) на ввоз радиоэлектронных средств и высокочастотных устройств гражданского назначения, в том числе встроенных либо входящих в состав других товаров</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					height: 297mm;
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
				
				.common {
					font: 13;
					/*font-weight: bold;*/
					font-family: Arial, serif;
				}
				
				/*.info tbody tr td {
					border: 0;
				}*/
				
			</style>
         </head>
         <body>
			<xsl:if test="rskrad:DocType='0'">
				<div class="page">
				   <h2>Заключение (разрешительный документ) на ввоз радиоэлектронных средств и высокочастотных устройств гражданского назначения, в том числе встроенных либо входящих в состав других товаров</h2>
				   <p class="remark">
					  <xsl:choose>
						 <xsl:when test="rskrad:IsCanceled='true' or rskrad:IsCanceled='t' or rskrad:IsCanceled='TRUE' or rskrad:IsCanceled='1' ">Документ не действителен</xsl:when>
						 <xsl:otherwise>Документ действителен</xsl:otherwise>
					  </xsl:choose>
				   </p>
				   <table border="1">
					  <tbody>
						 <xsl:if test="rskrad:OutDate">
							<tr>
							   <td class="common" width="30%">Дата вывоза</td>
							   <td>
								  <xsl:call-template name="russian_date">
									 <xsl:with-param name="dateIn" select="rskrad:OutDate"/>
								  </xsl:call-template>
							   </td>
							</tr>
						 </xsl:if>
						 <xsl:if test="rskrad:ImportObjective">
							<tr>
							   <td class="common">Цель вывоза</td>
							   <td>
								  <xsl:value-of select="rskrad:ImportObjective"/>
							   </td>
							</tr>
						 </xsl:if>
						 <xsl:if test="rskrad:RequesterName">
							<tr>
							   <td class="common">Наименование органа, обратившегося за получением разрешения на ввоз РЭС</td>
							   <td>
								  <xsl:value-of select="rskrad:RequesterName"/>
							   </td>
							</tr>
						 </xsl:if>
						 <xsl:if test="rskrad:PermissionOrganName">
							<tr>
							   <td class="common">Наименование органа, которому разрешается ввоз РЭС</td>
							   <td>
								  <xsl:value-of select="rskrad:PermissionOrganName"/>
							   </td>
							</tr>
						 </xsl:if>
						 <tr>
							<td class="common">Сведения о документе</td>
							<td>
							   <xsl:apply-templates select="rskrad:DocumentInfo"/>
							</td>
						 </tr>
						 <xsl:if test="rskrad:Owner">
							<tr>
							   <td class="common">Владелец</td>
							   <td>
								  <xsl:apply-templates select="rskrad:Owner"/>
							   </td>
							</tr>
						 </xsl:if>
						 <!--xsl:if test="rskrad:Contract">
							<tr>
							   <td class="common">Договор (контракт) на поставку РЭС</td>
							   <td>
								  <xsl:apply-templates select="rskrad:Contract"/>
							   </td>
							</tr>
						 </xsl:if-->
						 <xsl:if test="rskrad:OrganizationName">
							<tr>
							   <td class="common">Организация, поставляющая РЭС</td>
							   <td>
								  <xsl:apply-templates select="rskrad:OrganizationName"/>
							   </td>
							</tr>
						 </xsl:if>
						 <xsl:if test="rskrad:ContractsNumber">
							<tr>
							   <td class="common">Номера договоров (контрактов) на поставку РЭС</td>
							   <td>
								  <xsl:apply-templates select="rskrad:ContractsNumber"/>
							   </td>
							</tr>
						 </xsl:if>
						 <xsl:if test="rskrad:PostFio">
							<tr>
							   <td class="common">Лицо, подписавшее разрешение</td>
							   <td>
								  <xsl:apply-templates select="rskrad:PostFio"/>
							   </td>
							</tr>
						 </xsl:if>
					  </tbody>
				   </table>
				   <div class="header" style="margin-top:20px">Оборудование</div>
				   <table border="1">
					  <tbody>
						 <tr>
							<th>Тип РЭС</th>
							<th>Номер позиции товара по приложению разрешительного документа</th>
							<th>Модель, платформа</th>
							<th>Производитель</th>
							<th>Количество</th>
							<th>Страна - производитель</th>
						 </tr>
						 <xsl:apply-templates select="rskrad:ResItem"/>
					  </tbody>
				   </table>
				   <!--xsl:apply-templates select="rskrad:Signer"/-->
				</div>
			</xsl:if>	
			<xsl:if test="rskrad:DocType='1'">
				<div class="page">
				   <h2>Сведения о включении радиоэлектронных средств и (или) высокочастотных устройств гражданского назначения, в том числе встроенных либо входящих в состав других товаров, в единый реестр радиоэлектронных средств и высокочастотных устройств гражданского назначения, в том числе встроенных либо входящих в состав других товаров, при ввозе которых на таможенную территорию Евразийского экономического союза не требуется представление лицензии или заключения (разрешительного документа)</h2>
				   <p class="remark">
					  <xsl:choose>
						 <xsl:when test="rskrad:IsCanceled='true' or rskrad:IsCanceled='t' or rskrad:IsCanceled='1' ">Документ не действителен</xsl:when>
						 <xsl:otherwise>Документ действителен</xsl:otherwise>
					  </xsl:choose>
				   </p>
				   <table border="1">
					  <tbody>
						<tr>
						   <td class="common" width="50%">1. Номер в едином реестре</td>
						   <td>
							  <xsl:value-of select="rskrad:DocumentInfo/rskrad:ConclusionNumber"/>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">2. Дата включения в единый реестр</td>
						   <td>
							  <xsl:call-template name="russian_date">
								 <xsl:with-param name="dateIn" select="rskrad:DocumentInfo/rskrad:RegisterDate"/>
							  </xsl:call-template>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">3. Название государства-члена</td>
						   <td>
							  <xsl:value-of select="rskrad:DocumentInfo/rskrad:CountryName"/>
							  <xsl:if test="rskrad:DocumentInfo/rskrad:CountryName and rskrad:DocumentInfo/rskrad:CountryCode"> (</xsl:if>
							  <xsl:value-of select="rskrad:DocumentInfo/rskrad:CountryCode"/>
							  <xsl:if test="rskrad:DocumentInfo/rskrad:CountryName and rskrad:DocumentInfo/rskrad:CountryCode">)</xsl:if>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">4. Наименование и тип радиоэлектронного средства или высокочастотного устройства</td>
						   <td>
								<xsl:for-each select="rskrad:ResItem">
									<xsl:apply-templates select="rskrad:ResType"/>
									<xsl:if test="position() != last()">; </xsl:if>
								</xsl:for-each>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">5. Модель радиоэлектронного средства или высокочастотного устройства</td>
						   <td>
								<xsl:for-each select="rskrad:ResItem">
									<xsl:value-of select="rskrad:Model"/>
									<xsl:if test="position() != last()">; </xsl:if>
								</xsl:for-each>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">6. Полоса радиочастот, радиочастотный канал или радиочастота радиоэлектронного средства или высокочастотного устройства</td>
						   <td>
								<xsl:for-each select="rskrad:ResItem">
									<xsl:value-of select="rskrad:RadioBandInfo/rskrad:RadioBand"/>
									<xsl:if test="position() != last()">; </xsl:if>
								</xsl:for-each>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">7. Единица измерения частоты</td>
						   <td>
								<xsl:for-each select="rskrad:ResItem">
									<xsl:value-of select="rskrad:RadioBandInfo/rskrad:MeasureUnitNameRadioBand"/>
									<xsl:if test="position() != last()">; </xsl:if>
								</xsl:for-each>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">8. Мощность</td>
						   <td>
								<xsl:for-each select="rskrad:ResItem">
									<xsl:value-of select="translate(rskrad:EnginePowerMeasure/cat_ru:GoodsQuantity, '.', ',')"/>
									<xsl:if test="position() != last()">; </xsl:if>
								</xsl:for-each>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">9. Единица измерения мощности</td>
						   <td>
								<xsl:for-each select="rskrad:ResItem">
									<xsl:value-of select="rskrad:EnginePowerMeasure/cat_ru:MeasureUnitQualifierName"/>
									<xsl:if test="rskrad:EnginePowerMeasure/cat_ru:MeasureUnitQualifierName and rskrad:EnginePowerMeasure/cat_ru:MeasureUnitQualifierCode"> (</xsl:if>
									<xsl:value-of select="rskrad:EnginePowerMeasure/cat_ru:MeasureUnitQualifierCode"/>
									<xsl:if test="rskrad:EnginePowerMeasure/cat_ru:MeasureUnitQualifierName and rskrad:EnginePowerMeasure/cat_ru:MeasureUnitQualifierCode">)</xsl:if>
									<xsl:if test="position() != last()">; </xsl:if>
								</xsl:for-each>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">10. Изготовитель радиоэлектронного средства или высокочастотного устройства</td>
						   <td>
								<xsl:for-each select="rskrad:ResItem">
									<xsl:value-of select="rskrad:Manufacturer"/>
									<xsl:if test="position() != last()">; </xsl:if>
								</xsl:for-each>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">11. Страна изготовителя радиоэлектронного средства или высокочастотного устройства</td>
						   <td>
								<xsl:for-each select="rskrad:ResItem">
									<xsl:for-each select="rskrad:Country">
										<xsl:value-of select="."/>
										<xsl:if test="position() != last()">; </xsl:if>
									</xsl:for-each>
								</xsl:for-each>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">12. Иная техническая информация</td>
						   <td>
								<xsl:for-each select="rskrad:ResItem">
									<xsl:apply-templates select="rskrad:OtherInfo"/>
								</xsl:for-each>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">13. Статус</td>
						   <td>
							  <xsl:value-of select="rskrad:DocumentInfo/rskrad:Status"/>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">14. Срок действия</td>
						   <td>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rskrad:DocumentInfo/rskrad:DateTo"/>
								</xsl:call-template>
						   </td>
						</tr>
						<tr>
						   <td class="common" width="50%">15. Возможность ввоза на территорию Республики Беларусь физическими лицами для личного пользования</td>
						   <td>
							  <xsl:value-of select="rskrad:PossibilityImportRB"/>
						   </td>
						</tr>
					  </tbody>
				   </table>
				</div>
			</xsl:if>	
         </body>
      </html>
   </xsl:template>
   <xsl:template match="rskrad:DocumentInfo | rskrad:Contract">
      <span>
		  <xsl:if test="rskrad:ConclusionNumber">
			  Номер: <xsl:value-of select="rskrad:ConclusionNumber"/>
		  </xsl:if>
		  
         <!--xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <br/>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if-->
      </span>
      <br/>
      <xsl:if test="rskrad:DateTo">
         <span>Действителен до </span>
         <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="rskrad:DateTo"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <!--xsl:if test="sq_cat:ConclusionType">
         <span>
			Тип заключения: 
			<xsl:value-of select="sq_cat:ConclusionType"/>
         </span>
         <br/>
      </xsl:if-->
      <xsl:if test="rskrad:DocId">
         <span>
			Id документа:
			<xsl:value-of select="rskrad:DocId"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:choose>
         <xsl:when test="rskrad:DocType=1">
            <span>Тип документа: Временный ввоз РЭС</span>
            <br/>
         </xsl:when>
         <xsl:when test="rskrad:DocType=2">
            <span>Тип документа: Ввоз РЭС для личного использования</span>
            <br/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="rskrad:ChangeDate">
         <span>
			Дата последнего изменения: 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="rskrad:ChangeDate"/>
            </xsl:call-template>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="rskrad:Status">
         <span>
			Статус разрешения на ввоз: 
			<xsl:value-of select="rskrad:Status"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rskrad:Owner | rskrad:OrganizationName">
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
      <xsl:if test="rskrad:OwnerId">
         <span>	
			Идентификатор владельца в ЕИС: 
			<xsl:value-of select="rskrad:OwnerId"/>
         </span>
      </xsl:if>
      <xsl:if test="rskrad:OwnerVersionId">
         <span>	
			Идентификатор версии владельца в ЕИС: 
			<xsl:value-of select="rskrad:OwnerVersionId"/>
         </span>
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
   <xsl:template match="rskrad:ResItem">
      <tr>
         <td>
            <xsl:value-of select="rskrad:ResType"/>
         </td>
         <td>
            <xsl:value-of select="rskrad:Numeric"/>
         </td>
         <td>
            <xsl:value-of select="rskrad:Model"/>
         </td>
         <td>
            <xsl:value-of select="rskrad:Manufacturer"/>
         </td>
         <td>
            <xsl:value-of select="rskrad:Quantity/cat_ru:GoodsQuantity"/> <xsl:if test="rskrad:Quantity/cat_ru:MeasureUnitQualifierName">
               <xsl:value-of select="rskrad:Quantity/cat_ru:MeasureUnitQualifierName"/>
            </xsl:if>
            <xsl:if test="rskrad:Quantity/cat_ru:MeasureUnitQualifierCode"> (<xsl:value-of select="rskrad:Quantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
         </td>
         <td>
            <xsl:for-each select="rskrad:Country">
               <xsl:value-of select="."/>
               <br/>
            </xsl:for-each>
         </td>
      </tr>
   </xsl:template>
   <!--xsl:template match="rskrad:Signer">
      <table border="0" style="margin-top:50px; width:100%">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:value-of select="cat_ru:PersonPost"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td align="center" style="border:0;">Ф.И.О.</td>
               <td style="border:0;"/>
               <td align="center" style="border:0;">Должность</td>
               <td style="border:0;"/>
               <td align="center" style="border:0;">Дата подписания</td>
            </tr>
         </tbody>
      </table>
   </xsl:template-->
</xsl:stylesheet>
