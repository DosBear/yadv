<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:tns="urn:customs.ru:Information:SertifDocuments:CultTargetPurpose:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа CultTargetPurposeType -->
	<xsl:template match="tns:CultTargetPurpose">
		<xsl:variable name="impex" select="tns:RelocationSign"/>
      <html>
         <head>
            <title>Подтверждение целевого назначения материалов, ввозимых в рамках Соглашения о ввозе материалов образовательного, научного и культурного характера от 22 ноября 1950 г.</title>
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
					/*padding-left: 20mm;*/
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
					/*padding-left: 20mm;*/
					background: #ffffff;
					border: solid 1pt #000000;
				}

				.title {
					font-weight: bold
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
					/*border: 1px solid gray;*/
					/*font-family: Courier, serif;*/
					vertical-align:top;
				}
				
				td.bordered {
					border: 1px solid gray;
				}

				.low {
					font: 12;
					font-family: Arial, serif;
				}
			</style>
         </head>
         <body>
            <div class="page">
                  <h2>Подтверждение целевого назначения материалов, ввозимых в рамках Соглашения о ввозе материалов образовательного, научного и культурного характера от 22 ноября 1950 г.</h2>
               <table>
                    <xsl:if test="tns:LastUpdate">
                        <tr>
                           <td class="title" style="width: 30%">Дата последнего обновления</td>
                           <td>
								<xsl:call-template name="russian_date">
								   <xsl:with-param name="dateIn" select="tns:LastUpdate"/>
								</xsl:call-template>
							</td>
                        </tr>
                    </xsl:if>
                     <xsl:if test="tns:orgUnitCode">
                        <tr>
                           <td class="title" style="width: 30%">Отправитель запроса</td>
                           <td><xsl:value-of select="tns:orgUnitCode"/></td>
                        </tr>
                    </xsl:if>
				   <xsl:if test="tns:BDRDID">
					   <tr>
                           <td class="title" style="width: 30%">Идентификатор документа по БД РД</td>
                           <td><xsl:value-of select="tns:BDRDID"/></td>
                       </tr>
                     </xsl:if>
                     <tr><td colspan="2"><br/></td> </tr>
                    <tr>
                        <td class="title" style="width: 30%; vertical-align: middle">Заключение<br/>(разрешительный документ,<br/>письмо-подтверждение)<br/>
							<xsl:choose>
								<xsl:when test="tns:RelocationSign='0'">на ввоз</xsl:when>
								<xsl:when test="tns:RelocationSign='1'">на вывоз</xsl:when>
							</xsl:choose>
                        </td>
                        <td class="bordered">
                            <b><xsl:apply-templates select="tns:Conclusion"/></b>
                            <xsl:if test="tns:IssuedByOrg or tns:IssuedByPerson">
								<br/>Выдан(о): 
								<xsl:value-of select="tns:IssuedByOrg"/>
								<xsl:if test="tns:IssuedByPerson"> (<xsl:value-of select="tns:IssuedByPerson"/>)</xsl:if>
                            </xsl:if>
                            <xsl:if test="tns:IsTemporary">
								<br/>Режим ввоза/вывоза: 
								<xsl:choose>
									<xsl:when test="tns:IsTemporary='1' or tns:IsTemporary='true'"> временный</xsl:when>
									<xsl:when test="tns:IsTemporary='0' or tns:IsTemporary='false'"> постоянный</xsl:when>
									<xsl:otherwise><xsl:value-of select="tns:IsTemporary"/></xsl:otherwise>
								</xsl:choose>
                            </xsl:if>
                            <xsl:if test="tns:From or tns:To">
								<br/>Период действия: 
								<xsl:if test="tns:From">c 
									<xsl:call-template name="russian_date">
									   <xsl:with-param name="dateIn" select="tns:From"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="tns:To"> по 
									<xsl:call-template name="russian_date">
									   <xsl:with-param name="dateIn" select="tns:To"/>
									</xsl:call-template>
								</xsl:if>
                            </xsl:if>
                            <xsl:if test="tns:Country">
								<br/>Страна: 
								<xsl:value-of select="tns:Country"/>
                            </xsl:if>
                       </td>
                    </tr>
                    <tr><td colspan="2"><br/></td> </tr>
                    <xsl:if test="tns:ImportDatas">
                        <tr>
                           <td class="title" style="width: 30%; vertical-align: middle">Сведения по ввозу</td>
                           <td class="bordered"><xsl:apply-templates select="tns:ImportDatas"/></td>
                        </tr>
                        <tr><td colspan="2"><br/></td> </tr>
                    </xsl:if>
                    <xsl:if test="tns:ExportDatas">
                        <tr>
                           <td class="title" style="width: 30%; vertical-align: middle">Сведения по вывозу</td>
                           <td class="bordered"><xsl:apply-templates select="tns:ExportDatas"/></td>
                        </tr>
                        <tr><td colspan="2"><br/></td> </tr>
                    </xsl:if>
                    <tr>
                        <td class="title" style="width: 30%; vertical-align: middle">Сведения о материалах образовательного, научного и культурного характера</td>
                        <td><xsl:apply-templates select="tns:Items"/></td>
                        <tr><td colspan="2"><br/></td> </tr>
                    </tr>
                     <xsl:if test="tns:HasImage">
                        <tr>
                           <td class="title" style="width: 30%">Наличие изображения культурных ценностей</td>
                           <td>
							   <xsl:choose>
									<xsl:when test="tns:HasImage='1' or tns:HasImage='true'">есть</xsl:when>
									<xsl:otherwise>нет</xsl:otherwise>
								</xsl:choose>
                           </td>
                        </tr>
                    </xsl:if>
             </table>
            </div>
         </body>
      </html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="tns:Contract | tns:Conclusion">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate"> от 
			 <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
             </xsl:call-template>
         </xsl:if>
      </span>
	</xsl:template>
	<!-- Шаблон для типа tns:ExportDataType -->
	<xsl:template match="tns:ExportDatas">
		<b>Получатель заключения: </b><br/>
		<xsl:value-of select="tns:DocOwnerName"/><br/>
		<xsl:if test="tns:DocOwnerAddress">
			Юридический адрес: <xsl:value-of select="tns:DocOwnerAddress"/><br/>
		</xsl:if>
		Цель вывоза: <xsl:value-of select="tns:Purpose"/><br/>
		Основание вывоза (номер и дата выдачи распоряжения): <xsl:value-of select="tns:Reason"/>
	</xsl:template>
	<!-- Шаблон для типа tns:ImportDataType -->
	<xsl:template match="tns:ImportDatas">
		<b>Держатель подтверждения: </b><br/>
		<xsl:value-of select="tns:DocOwnerName"/><br/>
		<xsl:if test="tns:DocOwnerAddress">
			Юридический адрес: <xsl:value-of select="tns:DocOwnerAddress"/><br/>
		</xsl:if>
		<xsl:if test="tns:DocOwnerInn">
			ИНН: <xsl:value-of select="tns:DocOwnerInn"/><br/>
		</xsl:if>
		<xsl:if test="tns:ReceiverName or tns:ReceiverAddress or tns:ReceiverInn">
			<br/><b>Получатель материалов образовательного, научного и культурного характера: </b><br/>
		</xsl:if>	
		<xsl:if test="tns:ReceiverName">	
			<xsl:value-of select="tns:ReceiverName"/><br/>
		</xsl:if>
		<xsl:if test="tns:ReceiverAddress">
			Юридический адрес: <xsl:value-of select="tns:ReceiverAddress"/><br/>
		</xsl:if>
		<xsl:if test="tns:ReceiverInn">
			ИНН: <xsl:value-of select="tns:ReceiverInn"/><br/>
		</xsl:if>
		<xsl:if test="tns:Contract ">
			<br/><b>Контракт: </b><xsl:apply-templates select="tns:Contract "/><br/>
		</xsl:if>
		<xsl:if test="tns:AgreementSection">
			<br/><b>Пункт (подпункт) приложения к Соглашению и(или) Протоколу: </b><xsl:value-of select="tns:AgreementSection"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа tns:ItemType -->
	<xsl:template match="tns:Item">
		<tr>
			<td class="bordered">
				<xsl:value-of select="tns:Category"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="tns:Description"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="tns:Quantity"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="tns:SupplementaryQuantity"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="tns:OriginCountryName"/>
			</td>
			<td class="bordered">
				<xsl:for-each select="tns:Lefttover">
					<xsl:apply-templates select="."/>
					<xsl:if test="position() != last()">, </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа SupplementaryQuantityType -->
	<xsl:template match="tns:Quantity| tns:SupplementaryQuantity| tns:Lefttover">
		<xsl:choose>
			<xsl:when test="substring(cat_ru:GoodsQuantity, 1, 1)='.'"><xsl:value-of select="translate(concat('0', cat_ru:GoodsQuantity), '.', ',')"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/></xsl:otherwise>
		</xsl:choose>
		<!--xsl:value-of select="translate(cat_ru:GoodsQuantity, '0.00', '.', ',')"/-->
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>	
	<!-- Шаблон для типа tns:ArrayOfItemType -->
	<xsl:template match="tns:Items">
		<xsl:if test="tns:Item">
			<table>
				<tr class="title">
					<td class="bordered" style="vertical-align: middle">Категория</td>
					<td class="bordered" style="vertical-align: middle">Описание</td>
					<td class="bordered" style="vertical-align: middle">Количество</td>
					<td class="bordered" style="vertical-align: middle">Количество товара в ДЕИ</td>
					<td class="bordered" style="vertical-align: middle">Страна происхождения</td>
					<td class="bordered" style="vertical-align: middle">Остаток по квоте</td>
				</tr>
				<xsl:for-each select="tns:Item">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
