<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mnspch="urn:customs.ru:Information:SQDocuments:MinSportRosPechLic:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="mnspch:MinSportRosPechLic">
      <html>
         <head>
            <title>Ответ на запрос документов о подтверждении целевого назначения материалов</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					background: #cccccc;
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
			</style>
         </head>
         <body>
            <div class="page">
               <xsl:choose>
                  <xsl:when test="mnspch:DocSign=1">
                     <h2>Ответ на запрос справки о подтверждении целевого назначения материалов</h2>
                  </xsl:when>
                  <xsl:when test="mnspch:DocSign=3">
                     <h2>Ответ на запрос на получение изменений</h2>
                  </xsl:when>
                  <xsl:otherwise>
                     <h2>Ответ на запрос письма о подтверждении целевого назначения материалов</h2>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:for-each select="mnspch:Document">
                  <p class="remark">
                     <xsl:if test="mnspch:IsCanceled">
                        <xsl:choose>
                           <xsl:when test="mnspch:IsCanceled='true' or mnspch:IsCanceled='t' or mnspch:IsCanceled='1' ">Документ не действует</xsl:when>
                           <xsl:otherwise>Документ действует</xsl:otherwise>
                        </xsl:choose>
                     </xsl:if>
                  </p>
                  <xsl:if test="mnspch:BDRDID">
                     <span class="header">Идентификатор документа по БД РД:</span>
                     <span>
                        <xsl:value-of select="mnspch:BDRDID"/>
                     </span>
                     <br/>
                  </xsl:if>
                  <xsl:if test="mnspch:AdditionalInfo">
                     <span class="header">Дополнительная информация:</span>
                     <span>
                        <xsl:value-of select="mnspch:AdditionalInfo"/>
                     </span>
                     <br/>
                  </xsl:if>
                  <xsl:if test="mnspch:Paragraph">
                     <span class="header">Пункт приложения к протоколу:</span>
                     <span>
                        <xsl:value-of select="mnspch:Paragraph"/>
                     </span>
                     <br/>
                  </xsl:if>
                  <xsl:apply-templates select="mnspch:Confirmation"/>
                  <xsl:apply-templates select="mnspch:ContractDetails"/>
                  <div class="header">
                     <span>Сведения о лице, которому выдано подтверждение</span>
                  </div>
                  <xsl:apply-templates select="mnspch:Person"/>
                  <div class="header">
                     <span>Сведения о получателе товаров</span>
                  </div>
                  <xsl:apply-templates select="mnspch:Recipient"/>
                  <xsl:apply-templates select="mnspch:AuthorisedPerson"/>
                  <h2>Описание товаров</h2>
                  <table border="1" style="table-layout:fixed;word-wrap:break-word; width:100%;">
                     <tr>
                        <th>Описание товара</th>
                        <th>Страна происхождения</th>
                        <th>Количество</th>
                        <th>Количество в доп. единицах измерения</th>
                        <th>Производитель</th>
                     </tr>
                     <xsl:apply-templates select="mnspch:GoodsDescription"/>
                  </table>
               </xsl:for-each>
               <xsl:if test="mnspch:StampNum">
                     <span class="header">Номер операции:</span>
                     <span>
                        <xsl:value-of select="mnspch:StampNum"/>
                     </span>
                     <br/>
                  </xsl:if>
                <xsl:if test="mnspch:StampDate">
                     <span class="header">Дата операции:</span>
                     <span>
						<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mnspch:StampDate"/></xsl:call-template>
                     </span>
                     <br/>
                  </xsl:if>
                <xsl:if test="mnspch:StampAction">
                     <span class="header">Вид операции:</span>
                     <span>
                        <xsl:choose>
							<xsl:when test="mnspch:StampAction=1">Создание нового подтверждения</xsl:when>
							<xsl:when test="mnspch:StampAction=2">Изменение нового подтверждения</xsl:when>
							<xsl:when test="mnspch:StampAction=3">Отмена существующего подтверждения</xsl:when>
							<xsl:otherwise><xsl:value-of select="mnspch:StampAction"/></xsl:otherwise>
						</xsl:choose>
                     </span>
                     <br/>
                  </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="mnspch:Confirmation">
      <div class="header">
         <span>Подтвержение</span>
      </div>
      <xsl:if test="mnspch:ConfirmationId">
         <span>Идентификатор подтверждения: </span>
         <xsl:value-of select="mnspch:ConfirmationId"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentName or cat_ru:PrDocumentNumber or cat_ru:PrDocumentDate">
         <span>Документ: </span>
         <span>
            <xsl:value-of select="cat_ru:PrDocumentName"/>
            <xsl:if test="cat_ru:PrDocumentNumber">
				№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
            </xsl:if>
            <xsl:if test="cat_ru:PrDocumentDate">
				создан 
				<xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
               </xsl:call-template>
            </xsl:if>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="mnspch:DueDate">
         <span>Срок действия: </span>
         <span>
            <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="mnspch:DueDate"/>
            </xsl:call-template>
         </span>
         <br/>
      </xsl:if>
      <span>Дата и время последнего изменения: </span>
      <span>
         <xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="mnspch:LastChangeDate"/>
         </xsl:call-template>
      </span>
      <br/>
      <span>Статус: </span>
      <span>
         <xsl:value-of select="mnspch:ConfirmationStatus/mnspch:Name"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		(код статуса <xsl:value-of select="mnspch:ConfirmationStatus/mnspch:Code"/>)
	</span>
      <br/>
   </xsl:template>
   <xsl:template match="mnspch:ContractDetails">
      <div class="header">
         <span>Контракт</span>
      </div>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
   </xsl:template>
   <xsl:template match="mnspch:Person | mnspch:Recipient | mnspch:Manufacturer">
      <xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if>
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
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
      <xsl:if test="mnspch:PersonStatus">
         <span>
			Статус лица:
			<xsl:choose>
               <xsl:when test="mnspch:PersonStatus = '0'">Юридическое лицо</xsl:when>
               <xsl:otherwise>Физическое лицо</xsl:otherwise>
            </xsl:choose>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="mnspch:ManufacturerAddress">
         <xsl:apply-templates select="mnspch:ManufacturerAddress"/>
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
   <xsl:template match="mnspch:GoodsDescription">
      <tr>
         <td>
            <xsl:value-of select="mnspch:CommodityName"/>
         </td>
         <td>
            <xsl:value-of select="mnspch:OriginCountry"/>
         </td>
         <td>
            <xsl:for-each select="mnspch:GoodsQuantity">
               <xsl:value-of select="cat_ru:GoodsQuantity"/>
               <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
               <xsl:if test="cat_ru:MeasureUnitQualifierCode">
					(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
				</xsl:if>
            </xsl:for-each>
         </td>
         <td>
            <xsl:for-each select="mnspch:SupplementaryGoodsQuantity">
               <xsl:value-of select="cat_ru:GoodsQuantity"/>
               <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
               <xsl:if test="cat_ru:MeasureUnitQualifierCode">
					(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
				</xsl:if>
            </xsl:for-each>
         </td>
         <td>
            <xsl:apply-templates select="mnspch:Manufacturer"/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="mnspch:ManufacturerAddress">
      <br/>
      <span>Адрес:</span>
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
   <xsl:template match="mnspch:AuthorisedPerson">
      <div class="header">
         <span>Уполномоченное лицо</span>
      </div>
      <span>
         <xsl:value-of select="cat_ru:PersonSurname"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:PersonName"/>
         <xsl:if test="cat_ru:PersonMiddleName">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:PersonMiddleName"/>
         </xsl:if>
         <xsl:if test="cat_ru:PersonPost">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:PersonPost"/>
         </xsl:if>
         <xsl:if test="mnspch:ID">
			(идентификатор: <xsl:value-of select="mnspch:ID"/>)
		</xsl:if>
      </span>
   </xsl:template>
</xsl:stylesheet>
