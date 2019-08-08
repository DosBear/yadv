<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:sq_clt="urn:customs.ru:Information:SQDocuments:SQCommonLeafTypesCust:5.0.10" xmlns:cuco="urn:customs.ru:Information:SQDocuments:CultConfirm:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа CultConfirmType -->
	<xsl:template match="cuco:CultConfirm">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Подтверждение об отнесении ввозимых и временно ввозимых в Российскую Федерацию товаров (предметов) к культурным ценностям</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип сведений</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="cuco:RelocationSign=0">
										<xsl:text>при ввозе на территорию Российской Федерации не предусматривающий обратного вывоза</xsl:text>
									</xsl:when>
									<xsl:when test="cuco:RelocationSign=1">
										<xsl:text>при временном ввозе на территорию Российской Федерации</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="cuco:RelocationSign"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер подтверждения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cuco:RegNumber"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата выдачи подтверждения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="cuco:DateIssued"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="cuco:StartDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата начала действия</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cuco:StartDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cuco:EndDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата окончания действия</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cuco:EndDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cuco:LastUpdate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата последнего обновления документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cuco:LastUpdate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Сведения об органе Минкультуры, выдавшего подтверждение</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cuco:IssuedByOrg"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cuco:IssuedByPerson">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уполномоченное должностное лицо, подписавшее заключение (ФИО, должность)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cuco:IssuedByPerson"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cuco:Country">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Страна вывоза товара</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cuco:Country"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cuco:DocOwner">
						<div class="title marg-top">Сведения о держателе подтверждения</div>
					</xsl:if>
					<xsl:apply-templates select="cuco:DocOwner"/>
					<xsl:if test="cuco:Recipient">
						<div class="title marg-top">Сведения о грузополучателе</div>
					</xsl:if>
					<xsl:apply-templates select="cuco:Recipient"/>
					<xsl:if test="cuco:ContractInfo">
						<div class="title marg-top">Контракт</div>
					</xsl:if>
					<xsl:apply-templates select="cuco:ContractInfo"/>
					<div class="title marg-top">Сведения по культурным ценностям</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Категория</td>
								<td class="graphMain bordered">Описание</td>
								<td class="graphMain bordered">Количество товара</td>
								<td class="graphMain bordered">Остаток по квоте</td>
							</tr>
							<xsl:for-each select="cuco:Items">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="cuco:HasImage">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Наличие изображений культурных ценностей</td>
								<td class="value graphMain" style="width:50%">
									<xsl:if test="cuco:HasImage='true' or cuco:HasImage='1'">есть</xsl:if>
									<xsl:if test="cuco:HasImage='false' or cuco:HasImage='0'">нет</xsl:if>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cuco:OrgUnitCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Мнемоника отправителя запроса</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cuco:OrgUnitCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures| RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures| RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures| RUScat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures| RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures | RUScat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="cuco:ContractInfo">
		<xsl:if test="cat_ru:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUOrganizationNameAddrType -->
	<xsl:template match="cuco:Recipient| cuco:DocOwner">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="RUScat_ru:OrganizationName" />
					<xsl:if test="not(RUScat_ru:OrganizationName)"><xsl:value-of select="RUScat_ru:ShortName"/></xsl:if>
				</td>
			</tr>
			<xsl:if test="RUScat_ru:RFOrganizationFeatures or RUScat_ru:RKOrganizationFeatures or RUScat_ru:RBOrganizationFeatures or RUScat_ru:RAOrganizationFeatures or RUScat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:Address">
				<tr>
					<td class="annot graphMain" style="width:50%">Юридический адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:Address" /></td>
				</tr>	
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cuco:ArrayOfItemType -->
	<xsl:template match="cuco:Items">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cuco:Category"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cuco:Description"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cuco:Quantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cuco:Lefttover"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="cuco:Lefttover">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="cuco:Quantity|cuco:Lefttover">
		<xsl:for-each select="*">
			<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">(</xsl:if>
				<xsl:value-of select="."/>
			<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">)</xsl:if>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="position()!=last()"><br/></xsl:if>
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
