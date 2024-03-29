<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ESADout_CU cat_ru catESAD_cu" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:ESADout_CU="urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.14.3" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:goom="urn:customs.ru:Information:CustomsDocuments:GTDOutCustomsMark:5.14.3">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:variable name="k" select="1"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Электронная копия декларации на товары и транзитной декларации. Внешний формат.</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
              body {background: #CCCCCC; font-size: 9pt;}
              div.page {
              width: 210mm;
              margin: 10px auto;
              padding: 5mm 10mm;
              background: white;
              border: solid 1px black;
              page-break-before: always;
              }

              div.page_album {
              width: 297mm;
              margin: 10px auto;
              padding: 10mm;
              background: white;
              border: solid 1px black;
              page-break-before: always;
              }

              div.page.nobreak {
              page-break-before: avoid;
              }
              
              /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
              @media print {div.page {border: none; margin: 0; padding: 0;}}
              div.goods {background: white;}
              .bordered {
              border: solid 1px black;
              padding-top: 4pt;
              padding-bottom: 4pt;
              font-family: Arial;
              font-size: 9pt;
              font-weight: bold;
              }
              .underlined {border-bottom: solid 0.8pt black;}
              p.NumberDate {font-weight: bold;}
              .graph {font-family: Arial; font-size: 7pt;}
              .graphColumn {font-family: Arial; font-size: 6.5pt;}
              .graphTitleIt {font-family: Arial; font-size: 7pt; font-style: italic;}
              .graphMain {font-family: Arial; font-size: 9pt; font-weight: bold; }
              .graphNum {font-family: Arial; font-size: 7pt; font-weight: bold;}
              .graphNo {font-size: 7pt; font-weight: bold;}
              h1{font-size: 12pt;}
              table.addInfo {border-collapse: collapse; vertical-align: top;}
              table.addInfo th {border: 1px solid black; background-color: LightGrey;}
              table.addInfo td {border: 1px solid black; vertical-align: top;}
              hr {border: 0; border-bottom: 1px solid black; margin: 0;}
              .tr {border-right: 1px solid black;}
              .tl {border-left: 1px solid black;}
              .tb {border-bottom: 1px solid black;}
              .tt {border-top: 1px solid black;}
              .br {border-right: 2px solid black;}
              .bl {border-left: 2px solid black;}
              .bb {border-bottom: 2px solid black;}
              .bt {border-top: 2px solid black;}
              .db {border-bottom: 1px dashed black;}
              .dl {border-left: 1px dashed black;}
              .number {
              text-align: center;
              color: black;
              font-size: 11pt;
              font-weight: bold;
              vertical-align: middle;
              }
                </style>
			</head>
			<body>
				<div class="page nobreak">
					<xsl:apply-templates select="//ESADout_CU:ESADout_CU/ESADout_CU:ESADout_CUGoodsShipment"/>
				</div>
				<!--Выводим товары 2 - ..., группируя их по 3 шт. на лист-->
				<xsl:for-each select="//ESADout_CU:ESADout_CUGoods">
					<xsl:if test="(position() - 1) mod 3 = 1">
						<xsl:variable name="firstEntryPos" select="position()"/>
						<div class="page">
							<xsl:call-template name="td4Head"/>
							<xsl:for-each select="//ESADout_CU:ESADout_CUGoods">
								<xsl:if test="position() >= $firstEntryPos and position() &lt;= $firstEntryPos + 2">
									<xsl:apply-templates select="."/>
								</xsl:if>
							</xsl:for-each>
							<table cellpadding="0" cellspacing="0" style="width: 100%; margin: 0;">
								<tr>
									<td class="bt" rowspan="2" style="width: 73px; vertical-align: top;">
										<span class="graphNo">47</span>
										<span class="graphColumn">Исчисление платежей</span>
									</td>
									<td style="width: 45%;">
										<xsl:apply-templates mode="payments" select="//ESADout_CU:ESADout_CUGoods[position() = $firstEntryPos]"/>
									</td>
									<td>
										<xsl:apply-templates mode="payments" select="//ESADout_CU:ESADout_CUGoods[position() = $firstEntryPos + 1]"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:apply-templates mode="payments" select="//ESADout_CU:ESADout_CUGoods[position() = $firstEntryPos + 2]"/>
									</td>
									<td/>
								</tr>
							</table>
						</div>
					</xsl:if>
				</xsl:for-each>
				<!--xsl:if test="//ESADout_CU:ESADoutContractList">
                    <div class="page"><xsl:apply-templates select="//ESADout_CU:ESADout_CUGoods" mode="foreignTradeContracts"/></div>
                </xsl:if-->
				<xsl:if test="//ESADout_CU:GoodsAutomobile">
					<div class="page_album">
						<xsl:apply-templates mode="automobile" select="//ESADout_CU:ESADout_CUGoods"/>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!--Верхняя часть листа ТД4-->
	<xsl:template name="td4Head">
		<table style="width: 100%; vertical-align: top; border-collapse: collapse; font-size: 7pt;">
			<xsl:choose>
				<xsl:when test="(..//..//ESADout_CU:CustomsProcedure = 'ТТ') or (..//..//ESADout_CU:CustomsProcedure = 'TT')">
					<tr>
						<td style="width: 71px;"/>
						<td class="header nowrap graphMain" colspan="5">ДОБАВОЧНЫЙ ЛИСТ К ТРАНЗИТНОЙ ДЕКЛАРАЦИИ</td>
						<td class="tl nowrap" colspan="6">
							<b>А</b>
						</td>
					</tr>
					<tr>
						<td/>
						<td class="tb">
							<table class="inline">
								<tr>
									<td class="header graphMain"/>
									<td class="number blankNumber" title="Номер бланка"/>
								</tr>
							</table>
						</td>
						<td class="bl bt br" colspan="4">
							<b>1</b> ДЕКЛАРАЦИЯ</td>
						<td colspan="6"/>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td style="width: 71px;"/>
						<td class="header nowrap graphMain" colspan="5">ДОБАВОЧНЫЙ ЛИСТ К ДЕКЛАРАЦИИ НА ТОВАРЫ</td>
						<td class="tl nowrap" colspan="6">
							<b>А</b>
						</td>
					</tr>
					<tr>
						<td/>
						<td class="tb">
							<table class="inline">
								<tr>
									<td class="header graphMain"/>
									<td class="number blankNumber" title="Номер бланка"/>
								</tr>
							</table>
						</td>
						<td class="bl bt br" colspan="4">
							<b>1</b> ДЕКЛАРАЦИЯ</td>
						<td colspan="6"/>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
			<!--td colspan="4" class="bl bt br">
					<b>1</b> ДЕКЛАРАЦИЯ</td>
				<td colspan="6"/>
			</tr-->
			<tr>
				<td/>
				<td class="tl green">
					<table class="inline">
						<tr>
							<td class="nowrap" style="width: 40%;">
								<b>2</b> Отправитель/<i>Экспортер</i>
							</td>
							<td class="nowrap" style="width: 40%;">
								<!--b>8</b> Получатель -->
							</td>
							<td>№</td>
						</tr>
					</table>
				</td>
				<td class="bl br" colspan="4"/>
				<td colspan="6"/>
			</tr>
			<tr>
				<td/>
				<td class="tl green br" rowspan="3" style="border-bottom:solid 0.8pt black;">
					<xsl:if test="//ESADout_CU:CustomsProcedure='ЭК' or 
									(//ESADout_CU:CustomsProcedure='ТТ' and //ESADout_CU:TransitDirectionCode!='ИМ')">
						<!-- Отправитель -->
						<xsl:for-each select="//ESADout_CU:ESADout_CUConsignor">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</xsl:if>
					<hr/>
					<b>8</b> Получатель<br/>
					<xsl:if test="//ESADout_CU:CustomsProcedure='ИМ' or 
									(//ESADout_CU:CustomsProcedure='ТТ' and //ESADout_CU:TransitDirectionCode!='ЭК')">
						<!-- Получатель -->
						<xsl:for-each select="//ESADout_CU:ESADout_CUConsignee">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</xsl:if>
				</td>
				<td class="bl bb br containTable" colspan="4" style="vertical-align: bottom;">
					<table class="inline">
						<tr>
							<td class="green" style="vertical-align: bottom; text-align: left; width: 30%;"/>
							<td class="tr green" style="vertical-align: bottom; text-align: right; width: 1%;">
								<b>C</b>
							</td>
							<td class="tr"/>
							<td class="green" style="vertical-align: bottom; text-align: right; width: 50%;">
								<b>BIS</b>
							</td>
						</tr>
					</table>
				</td>
				<td colspan="6"/>
			</tr>
			<tr>
				<td/>
				<td class="nowrap" colspan="2">
					<b>3</b> Формы
			<xsl:apply-templates select="catESAD_cu:AdditionalSheetCount"/>
					<xsl:text> | </xsl:text>
					<xsl:apply-templates select="//catESAD_cu:TotalSheetNumber"/>
				</td>
				<td class="br tb bl number" rowspan="2">1</td>
				<td class="br tb bl number" rowspan="2">6</td>
				<td colspan="4"/>
			</tr>
			<tr>
				<td class="tb"/>
				<td class="tb"/>
				<td class="tb"/>
				<td class="tb" colspan="6"/>
			</tr>
		</table>
	</xsl:template>
	<!--Дополнительные сведения по внешнеторговым контрактам. Заполняется при подаче ВГТД-->
	<xsl:template match="ESADout_CU:ESADout_CUGoods" mode="automobile">
		<xsl:if test="ESADout_CU:GoodsAutomobile">
			<h1>Данные по транспортному средству из товара № <xsl:apply-templates select="catESAD_cu:GoodsNumeric"/>
			</h1>
			<table class="addInfo">
				<tr>
					<th>Модель</th>
					<th style="width: 1%;">Марка</th>
					<th style="width: 1%;">Год изготовления</th>
					<th style="width: 1%;">Рабочий объем двигателя, куб. см</th>
					<th>Идентиф-й № кузова</th>
					<th>Двигатель</th>
					<th>Идентиф-й № шасси (рамы)</th>
					<th>№ удостоверения</th>
					<th>Стоимость</th>
					<th>Грузоподъемность/Мощность</th>
					<th>Пробег</th>
				</tr>
				<xsl:apply-templates select="ESADout_CU:GoodsAutomobile"/>
			</table>
		</xsl:if>
	</xsl:template>
	<!--Шаблон для типа catESAD_cu:CarCostInfoType-->
	<xsl:template match="catESAD_cu:CarCostInfo">
		<xsl:apply-templates select="catESAD_cu:CarCost"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="catESAD_cu:CarCostCurrencyCode"/>
	</xsl:template>
	<xsl:template match="ESADout_CU:GoodsAutomobile">
		<tr>
			<td>
				<xsl:apply-templates select="catESAD_cu:Model"/>
			</td>
			<td>
				<xsl:apply-templates select="catESAD_cu:Mark"/>
			</td>
			<td>
				<xsl:apply-templates select="catESAD_cu:OfftakeYear"/>
			</td>
			<td>
				<xsl:value-of select="catESAD_cu:EngineVolumeQuanity/catESAD_cu:MeasuredAmount"/>&#160;<xsl:value-of select="catESAD_cu:EngineVolumeQuanity/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:value-of select="catESAD_cu:EngineVolumeQuanity/catESAD_cu:MeasureUnitQualifierCode"/>)</td>
			<td>
				<xsl:apply-templates select="catESAD_cu:VINID"/>
			</td>
			<td>
				<xsl:apply-templates select="catESAD_cu:EngineID"/>
			</td>
			<td>
				<xsl:apply-templates select="catESAD_cu:ChassisID"/>
			</td>
			<td>
				<xsl:apply-templates select="catESAD_cu:IdentityCardNumber"/>
			</td>
			<td>
				<xsl:apply-templates select="catESAD_cu:CarCostInfo"/>
			</td>
			<td>
				<xsl:for-each select="catESAD_cu:EngineMaxPowerMeasure">
					<xsl:value-of select="catESAD_cu:MeasuredAmount"/>&#160;<xsl:value-of select="catESAD_cu:MeasureUnitQualifierName"/> (<xsl:value-of select="catESAD_cu:MeasureUnitQualifierCode"/>)<xsl:if test="position()!=last()">
						<xsl:text> </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="catESAD_cu:PassedKilometerQuantity">
					<xsl:value-of select="catESAD_cu:MeasuredAmount"/>&#160;<xsl:value-of select="catESAD_cu:MeasureUnitQualifierName"/> (<xsl:value-of select="catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!--Дополнительные сведения по внешнеторговым контрактам. Заполняется при подаче ВГТД-->
	<xsl:template match="*" mode="commaSeparated">
		<xsl:if test="position() > 1">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="catESAD_cu:InvoicedCost">
		<i>Стоим. по счету: </i>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="catESAD_cu:ContractCurrencyCode">
		<i>Код валюты счета: </i>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="cat_ru:MeasureUnitQualifierCode">
		<xsl:text>(</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<xsl:template match="catESAD_cu:CUESADDeliveryTerms">
		<br/>
		<xsl:if test="cat_ru:DeliveryTermsStringCode">
			<i>Код условий поставки по Инкотермс: </i>
			<xsl:apply-templates select="cat_ru:DeliveryTermsStringCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:DeliveryPlace">
			<i> Описание / Название географического пункта</i>
			<xsl:apply-templates mode="spaceSeparated" select="cat_ru:DeliveryPlace"/>
		</xsl:if>
		<xsl:if test="cat_ru:TransferPlace">
			<i> Место передачи товара </i>
			<xsl:apply-templates mode="spaceSeparated" select="cat_ru:TransferPlace"/>
		</xsl:if>
		<xsl:if test="cat_ru:DeliveryTermsRBCode">
			<i> Код вида поставки товаров в соответствии с классификатором видов поставок товаров, подлежащих учету при осуществлении экспортных операций, применяемым в Республике Беларусь </i>
			<xsl:apply-templates mode="spaceSeparated" select="cat_ru:DeliveryTermsRBCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:PrDocumentNumber">
		<i> № </i>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="cat_ru:PrDocumentDate">
		<i> дата: </i>
		<xsl:apply-templates mode="date"/>
	</xsl:template>
	<!-- Проверка на совпадение данных с гр.14 ДТ для отправителя и получателя-->
	<xsl:template match="ESADout_CU:ESADout_CUConsignor| ESADout_CU:ESADout_CUConsignee">
		<xsl:choose>
			<xsl:when test="RUDECLcat:EqualIndicator='1' or RUDECLcat:EqualIndicator='true' or RUDECLcat:EqualIndicator='True' or RUDECLcat:EqualIndicator='t'">СМ. ГРАФУ 14 ДТ</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="org" select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Проверка на совпадение данных с гр.14 ДТ для лица, ответственного за финансовое урегулирование-->
	<xsl:template match="ESADout_CU:ESADout_CUFinancialAdjustingResponsiblePerson">
		<xsl:choose>
			<xsl:when test="ESADout_CU:DeclarantEqualFlag='1' or ESADout_CU:DeclarantEqualFlag='true' or ESADout_CU:DeclarantEqualFlag='True' or ESADout_CU:DeclarantEqualFlag='t'">СМ. ГРАФУ 14 ДТ</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="org" select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Реквизиты организации -->
	<xsl:template match="*" mode="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph">(</span>
			<xsl:value-of select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:if test="RUDECLcat:SubjectAdditionalCode='1'"> 'контрагент'</xsl:if>
		<xsl:if test="RUDECLcat:SubjectAdditionalCode='2'"> 'РАЗНЫЕ ПО СПИСКУ'</xsl:if>
		<br/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:for-each select="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectBranch">
			<br/>
			<xsl:value-of select="RUScat_ru:SubjectBranch/cat_ru:OrganizationName"/>
			<br/>
			<xsl:if test="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
			<br/>
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
		</xsl:if>
		<br/>
		<xsl:apply-templates mode="spaceSeparated" select="RUScat_ru:IdentityCard"/>
	</xsl:template>
	<!--Товарная партия-->
	<xsl:template match="ESADout_CU:ESADout_CUGoodsShipment">
		<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
			<xsl:choose>
				<xsl:when test="(..//ESADout_CU:CustomsProcedure = 'ТТ') or(..//ESADout_CU:CustomsProcedure = 'TT') ">
					<tr>
						<td class="graphMain" colspan="2" style="width:{103*$k}mm;">ТРАНЗИТНАЯ ДЕКЛАРАЦИЯ</td>
						<td class="graph" style="width:{26.4*$k}mm;border-top:solid 2pt black;border-left:solid 2pt black;border-right:solid 2pt black;">
							<span class="graphNo">1</span>
							<span class="graph">ДЕКЛАРАЦИЯ</span>
						</td>
						<td class="graph" rowspan="4" style="width:{60.6*$k}mm;border-left:solid 0.8pt black;border-bottom:solid 0.8pt black;" valign="top"/>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="graphMain" colspan="2" style="width:{103*$k}mm;">ДЕКЛАРАЦИЯ НА ТОВАРЫ</td>
						<td style="width:{26.4*$k}mm;"/>
						<td class="graph" style="width:{60.6*$k}mm;border-left:solid 0.8pt black;" valign="top">
                    А 
                    <br/>
							<!-- Костя очень просил отобжать информацию из отметок -->
							<xsl:variable name="GTDID" select="//*[@DocumentModeID='1006078E']/goom:GTDID"/>
							<xsl:value-of select="$GTDID/cat_ru:CustomsCode"/>
							<xsl:text>/</xsl:text>
							<xsl:call-template name="russian_date_gtd">
								<xsl:with-param name="dateIn" select="$GTDID/cat_ru:RegistrationDate"/>
							</xsl:call-template>
							<xsl:text>/</xsl:text>
							<xsl:value-of select="$GTDID/cat_ru:GTDNumber"/>
						</td>
					</tr>
					<tr>
						<td class="graphMain" colspan="2" style="width:{103*$k}mm;">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
						<td class="graph" style="width:{26.4*$k}mm;border-top:solid 2pt black;border-left:solid 2pt black;border-right:solid 2pt black;">
							<span class="graphNo">1</span>
							<span class="graph">ДЕКЛАРАЦИЯ</span>
						</td>
						<td class="graph" rowspan="4" style="width:{60.6*$k}mm;border-bottom:solid 0.8pt black;" valign="top"/>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
			<tr valign="top">
				<td align="center" class="graphNum" style="width:{17*$k}mm;border:solid 1.5pt black;">1</td>
				<td rowspan="3" style="width:{86*$k}mm;border:solid 0.8pt black;background:#FFFFFF;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{43*$k}mm;">
								<span class="graphNo">2</span>
								<span class="graph">Отправитель/</span>
								<span class="graphTitleIt">Экспортер</span>
							</td>
							<td class="graph" style="width:{43*$k}mm;">
								<xsl:for-each select="ESADout_CU:ESADout_CUConsignor">
									<xsl:choose>
										<xsl:when test="ESADout_CU:DeclarantEqualFlag='1' or ESADout_CU:DeclarantEqualFlag='True' or ESADout_CU:DeclarantEqualFlag='true' or ESADout_CU:DeclarantEqualFlag='t'"/>
										<xsl:otherwise>
											<xsl:text>№ </xsl:text>
											<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
												<xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
											</xsl:if>
											<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN">
												<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
											</xsl:if>
											<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN">
												<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
												<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
												<xsl:text> / </xsl:text>
												<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="width:{86*$k}mm;">
								<xsl:for-each select="ESADout_CU:ESADout_CUConsignor">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</td>
						</tr>
					</table>
				</td>
				<td style="width:{26.4*$k}mm;border-left:solid 2pt black;border-right:solid 2pt black;border-bottom:solid 1.5pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td align="center" class="graph" rowspan="2" style="width:{8.8*$k}mm;border-right:solid 0.8pt black;background:#FFFFFF;">
								<xsl:value-of select="//ESADout_CU:CustomsProcedure"/>
							</td>
							<td align="center" class="graph" rowspan="2" style="width:{4.4*$k}mm;">
								<xsl:choose>
									<xsl:when test="(..//ESADout_CU:CustomsProcedure = 'ТТ') or (..//ESADout_CU:CustomsProcedure = 'TT')">
										<xsl:apply-templates select="//ESADout_CU:TransitFeature"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="//ESADout_CU:CustomsModeCode"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td align="center" class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
								<xsl:if test="//ESADout_CU:ElectronicDocumentSign">
									<xsl:value-of select="'ЭД '"/>
								</xsl:if>
								<xsl:apply-templates select="//ESADout_CU:TransitDirectionCode"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td rowspan="9" style="width:{17*$k}mm;border-left:solid 1.5pt black;border-right:solid 1.5pt black;"/>
				<td style="width:{26.4*$k}mm;border:solid 0.8pt black;background:#FFFFFF;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{13.2*$k}mm;border-right:solid 0.8pt black;">
								<span class="graphNo">3</span>
								<span class="graph">Формы</span>
							</td>
							<td class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt black;">
								<span class="graphNo">4</span>
								<span class="graph" style="white-space: nowrap;">Отгр. спец.</span>
								<br/>
								<xsl:apply-templates select="catESAD_cu:SpecificationNumber"/>
								<xsl:if test="catESAD_cu:SpecificationNumber and catESAD_cu:SpecificationListNumber">
									<xsl:text> / </xsl:text>
								</xsl:if>
								<xsl:apply-templates select="catESAD_cu:SpecificationListNumber"/>
							</td>
						</tr>
						<tr valign="top">
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-right:solid 0.8pt black;">1</td>
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<xsl:apply-templates select="catESAD_cu:TotalSheetNumber"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td align="center" class="graph" style="width:{13.2*$k}mm;border-right:solid 0.8pt black;background:#FFFFFF;">
								<span class="graphNo">5</span>
								<span class="graph">Всего т-ов</span>
								<br/>
								<xsl:value-of select="catESAD_cu:TotalGoodsNumber"/>
							</td>
							<td align="center" class="graph" style="width:{18.4*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;background:#FFFFFF;">
								<span class="graphNo">6</span>
								<span class="graph">Всего мест</span>
								<br/>
								<xsl:choose>
									<xsl:when test="catESAD_cu:TotalPackageNumber!=''">
										<xsl:value-of select="catESAD_cu:TotalPackageNumber"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" style="width:{45.4*$k}mm;border-left:solid 0.8pt black;">
								<span class="graphNo">7</span>
								<span class="graph">Справочный номер</span>
								<br/>
								<xsl:value-of select="//ESADout_CU:DeclarationKind"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td rowspan="2" style="width:{86*$k}mm;border:solid 0.8pt black;background:#FFFFFF;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="graph" style="width:{43*$k}mm;">
								<span class="graphNo">8</span>
								<span class="graph">Получатель</span>
							</td>
							<td class="graph" style="width:{43*$k}mm;">
								<xsl:for-each select="ESADout_CU:ESADout_CUConsignee">
									<xsl:choose>
										<xsl:when test="ESADout_CU:DeclarantEqualFlag='1' or ESADout_CU:DeclarantEqualFlag='True' or ESADout_CU:DeclarantEqualFlag='true' or ESADout_CU:DeclarantEqualFlag='t'"> </xsl:when>
										<xsl:otherwise>
											<xsl:text>№ </xsl:text>
											<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
												<xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
											</xsl:if>
											<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN">
												<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
											</xsl:if>
											<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN">
												<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
												<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
												<xsl:text> / </xsl:text>
												<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="width:{86*$k}mm;">
								<xsl:for-each select="ESADout_CU:ESADout_CUConsignee">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</td>
						</tr>
					</table>
				</td>
				<td class="graph" colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;" valign="top">
					<span class="graphNo">9</span>
					<span class="graph">Лицо, ответственное за финансовое урегулирование N </span>
					<xsl:if test="ESADout_CU:ESADout_CUFinancialAdjustingResponsiblePerson">
						<xsl:for-each select="ESADout_CU:ESADout_CUFinancialAdjustingResponsiblePerson">
							<xsl:choose>
								<xsl:when test="ESADout_CU:DeclarantEqualFlag='1' or ESADout_CU:DeclarantEqualFlag='True' or ESADout_CU:DeclarantEqualFlag='true' or ESADout_CU:DeclarantEqualFlag='t'">
									<br/>СМ. ГРАФУ 14 ДТ</xsl:when>
								<xsl:otherwise>
									<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
										<xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
									</xsl:if>
									<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN">
										<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
									</xsl:if>
									<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN">
										<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
									</xsl:if>
									<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
										<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</xsl:if>
									<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										<xsl:text> / </xsl:text>
										<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
									<br/>
									<xsl:apply-templates mode="org" select="."/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:if>
				</td>
			</tr>
			<tr valign="top">
				<td colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{15.4*$k}mm;">
								<span class="graphNo">10</span>
								<span class="graph">Стр.перв.назнач/</span>
							</td>
							<td class="graph" colspan="2" style="width:{16.2*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<span class="graphNo">11</span>
								<span class="graph">Торг.страна</span>
							</td>
							<td class="graph" rowspan="2" style="width:{43.6*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<span class="graphNo">12</span>
								<span class="graph">Общая таможенная стоимость</span>
								<br/>
								<br/>
								<xsl:if test="catESAD_cu:TotalCustCost">
									<xsl:value-of select="format-number(catESAD_cu:TotalCustCost,'0.00')"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:TotalCustomsValueAmount"> / <xsl:value-of select="format-number(catESAD_cu:TotalCustomsValueAmount,'0.00')"/>
								</xsl:if>
							</td>
							<td class="graph" rowspan="2" style="width:{11.8*$k}mm;border-left:solid 0.8pt black;word-break: break-all;">
								<span class="graphNo">13</span>
								<span class="graph"> </span>
							</td>
						</tr>
						<tr>
							<td align="center" class="graph" style="width:{8.8*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td align="center" class="graph" style="width:{8.8*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">
								<span class="graph">посл.отп.</span>
							</td>
							<td align="center" class="graph" style="width:{8.8*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:TradeCountryCode!=''">
										<xsl:value-of select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:TradeCountryCode"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td align="center" class="graph" style="width:{8.8*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:RBCountryCode!=''">
										<xsl:value-of select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:RBCountryCode"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td rowspan="2" style="width:{86*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="graph" style="width:{43*$k}mm;">
								<span class="graphNo">14</span>
								<span class="graph">Декларант</span>
							</td>
							<td class="graph" style="width:{43*$k}mm;">
								<xsl:text>№ </xsl:text>
								<xsl:if test="ESADout_CU:ESADout_CUDeclarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
									<xsl:value-of select="ESADout_CU:ESADout_CUDeclarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
								</xsl:if>
								<xsl:if test="ESADout_CU:ESADout_CUDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
									<xsl:value-of select="ESADout_CU:ESADout_CUDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
								</xsl:if>
								<xsl:if test="ESADout_CU:ESADout_CUDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
									<xsl:value-of select="ESADout_CU:ESADout_CUDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
								</xsl:if>
								<xsl:if test="ESADout_CU:ESADout_CUDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN">
									<xsl:value-of select="ESADout_CU:ESADout_CUDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</xsl:if>
								<xsl:if test="ESADout_CU:ESADout_CUDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
									<xsl:text> / </xsl:text>
									<xsl:value-of select="ESADout_CU:ESADout_CUDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</xsl:if>
							</td>
						</tr>
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{86*$k}mm;">
								<xsl:if test="ESADout_CU:ESADout_CUDeclarant">
									<xsl:apply-templates mode="org" select="ESADout_CU:ESADout_CUDeclarant"/>
								</xsl:if>
							</td>
						</tr>
					</table>
				</td>
				<td colspan="2" style="vertical-align: bottom;border-right:solid 0.8pt black;" valign="top">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="graph" style="width:{43.5*$k}mm;background:#FFFFFF;">
								<span class="graphNo">15</span>
								<span class="graph">Страна отправления</span>
								<br/>
								<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DispatchCountryName"/>
							</td>
							<td style="vertical-align: bottom;border:solid 0.8pt black;">
								<table cellpadding="0" cellspacing="0" style="width:100%;">
									<tr>
										<td class="graph" colspan="4" style="width:{25.6*$k}mm;">
											<span class="graphNo">15</span>
											<span class="graph">Код страны отпр.</span>
										</td>
									</tr>
									<tr>
										<br/>
										<td class="graph" style="width:{2.2*$k}mm;border-right:solid 0.8pt black;">a
                                </td>
										<td align="center" class="graph" style="width:{9.6*$k}mm;border-right:solid 0.8pt black;">
											<xsl:choose>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DispatchCountryCode!=''">
													<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DispatchCountryCode"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="graph" style="width:{2.2*$k}mm;border-right:solid 0.8pt black;">b
                                    </td>
										<td align="center" class="graph" style="width:{7.6*$k}mm;">
											<xsl:choose>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/catESAD_cu:RBDispatchCountryCode!=''">
													<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:RBDispatchCountryCode"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table cellpadding="0" cellspacing="0" style="width:100%;">
									<tr>
										<td class="graph" colspan="4" style="width:{21.7*$k}mm;">
											<span class="graphNo">17</span>
											<span class="graph">Код страны назнач.</span>
										</td>
									</tr>
									<tr>
										<br/>
										<td class="graph" style="width:{2.2*$k}mm;border-right:solid 0.8pt black;">a
                                </td>
										<td align="center" class="graph" style="width:{9.6*$k}mm;border-right:solid 0.8pt black;">
											<xsl:choose>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DestinationCountryCode!=''">
													<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DestinationCountryCode"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="graph" style="width:{2.2*$k}mm;border-right:solid 0.8pt black;">b
                                    </td>
										<td align="center" class="graph" style="width:{7.6*$k}mm;">
											<xsl:choose>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/catESAD_cu:RBDestinationCountryCode!=''">
													<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:RBDestinationCountryCode"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;" valign="top">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{43.5*$k}mm; border-right: solid 0.8pt black; height: 100%;">
								<span class="graphNo">16</span>
								<span class="graph">Страна происхождения</span>
								<br/>
								<xsl:choose>
									<xsl:when test="catESAD_cu:OriginCountryName">
										<xsl:apply-templates select="catESAD_cu:OriginCountryName"/>
									</xsl:when>
									<xsl:when test="catESAD_cu:OriginCountryCode">
										<xsl:apply-templates select="catESAD_cu:OriginCountryCode"/>
									</xsl:when>
								</xsl:choose>
							</td>
							<td class="graph" style="width:{43.5*$k}mm;background:#FFFFFF;">
								<span class="graphNo">17</span>
								<span class="graph">Страна назначения</span>
								<br/>
								<xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DestinationCountryName"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<table cellpadding="0" cellspacing="0" style="border-left:solid 0.8pt black;border-right:solid 0.8pt black;b" width="100%">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{60.4*$k}mm;background:#FFFFFF;">
								<span class="graphNo">18</span>
								<span class="graph">Идентификация и страна регистрации трансп.средства при отправлении/прибытии</span>
							</td>
							<td align="center" class="graph" style="width:{10*$k}mm;border-left:solid 2pt black;border-bottom:solid 0pt black;border-right:solid 2pt black;background:#FFFFFF;">
								<span class="graphNo">19</span>
								<span class="graph">Конт.</span>
							</td>
							<td class="graph" colspan="3" style="width:{91.1*$k}mm;border-left:solid 0pt black;">
								<span class="graphNo">20</span>
								<span class="graph">Условия поставки</span>
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:{56.3*$k}mm;background:#FFFFFF;">
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport">
										<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/ESADout_CU:TransportMeansQuantity"/>
										<xsl:text>:</xsl:text>
										<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/ESADout_CU:TransportMeans">
											<xsl:if test="position() &gt; 1">;</xsl:if>
											<xsl:value-of select="cat_ru:TransportIdentifier"/>
											<xsl:if test="catESAD_cu:FirstTrailerRegId">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="catESAD_cu:FirstTrailerRegId"/>
											</xsl:if>
											<xsl:if test="catESAD_cu:SecondTrailerRegId">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="catESAD_cu:SecondTrailerRegId"/>
											</xsl:if>
											<!--xsl:value-of select="cat_ru:TransportIdentifier[../cat_ru:ActiveTransportIdentifier=false()]"/>
											<xsl:variable name="ActiveTSNum" select="cat_ru:TransportIdentifier[../cat_ru:ActiveTransportIdentifier=false()]"/>
											<xsl:if test="following-sibling::ESADout_CU:TransportMeans/cat_ru:ActiveTransportIdentifier=./cat_ru:TransportIdentifier">
												<xsl:for-each select="following-sibling::ESADout_CU:TransportMeans/cat_ru:TransportIdentifier[../cat_ru:ActiveTransportIdentifier=$ActiveTSNum]">/<xsl:value-of select="."/>
												</xsl:for-each>
											</xsl:if>
											<xsl:variable name="count" select="count(../ESADout_CU:TransportMeans[cat_ru:ActiveTransportIdentifier=false()])"/>
											<xsl:if test="position() != $count and cat_ru:ActiveTransportIdentifier=false()">;&#032;</xsl:if-->
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/ESADout_CU:MethodTransport=1">газопровод </xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/ESADout_CU:MethodTransport=2">нефтепровод </xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/ESADout_CU:MethodTransport=3">нефтепродуктопровод </xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/ESADout_CU:MethodTransport=4">линия электропередачи </xsl:when>
								</xsl:choose>
								<xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/ESADout_CU:NameObject"/>
							</td>
							<td align="center" class="graph" style="width:{5.8*$k}mm;border-left:solid 2pt black;border-bottom:solid 1.5pt black;background:#FFFFFF;">
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportNationalityCode!=''">
										<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportNationalityCode"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td align="center" class="graph" style="width:{10*$k}mm;border-left:solid 2pt black;border-bottom:solid 1.5pt black;border-right:solid 2pt black;" valign="bottom">
								<!--	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>-->
								<xsl:choose>
									<xsl:when test="(number(ESADout_CU:ESADout_CUConsigment/catESAD_cu:ContainerIndicator)=1) or (ESADout_CU:ESADout_CUConsigment/catESAD_cu:ContainerIndicator='t') or (ESADout_CU:ESADout_CUConsigment/catESAD_cu:ContainerIndicator='true')">
                                        1
                                    </xsl:when>
									<xsl:when test="(number(ESADout_CU:ESADout_CUConsigment/catESAD_cu:ContainerIndicator)=0) or (ESADout_CU:ESADout_CUConsigment/catESAD_cu:ContainerIndicator='f') or (ESADout_CU:ESADout_CUConsigment/catESAD_cu:ContainerIndicator='false')">
                                        0
                                    </xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" style="width:{53.3*$k}mm;" valign="bottom">
								<table>
									<tbody>
										<tr>
											<td style="width:{10*$k}mm;border-right:solid 1pt black;">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td>
												<xsl:choose>
													<xsl:when test="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode!=''">
														<xsl:value-of select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
													</xsl:when>
												</xsl:choose>
												<xsl:choose>
													<xsl:when test="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace!=''">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:for-each select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace">
															<xsl:value-of select="."/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:for-each>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:value-of select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:TransferPlace"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td class="graph" style="width:{12*$k}mm;border-bottom:solid 0pt black;border-left:solid 1pt black;">
								<xsl:value-of select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsRBCode"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="width:{173*$k}mm;border:solid 0.8pt black;" valign="top">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{88*$k}mm;border-right:solid 1pt black;background:#FFFFFF;">
								<span class="graphNo">21</span>
								<span class="graph">Идентификация и страна регистрации активного
                                    трансп.средства на границе
                                </span>
							</td>
							<td class="graph" colspan="2" style="width:{37.5*$k}mm;border-left:solid 1pt black;border-right:solid 0.8pt black;">
								<span class="graphNo">22</span>
								<span class="graph">Валюта и общая сумма по счету</span>
							</td>
							<td align="center" class="graph" rowspan="2" style="width:{19*$k}mm;border-left:solid 1pt black;border-right:solid 0.8pt black;">
								<span class="graphNo">23</span>
								<span class="graph">Курс валюты</span>
								<br/>
								<br/>
								<xsl:value-of select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:ContractCurrencyRate"/>
							</td>
							<td class="graph" colspan="3" style="width:{28.5*$k}mm;">
								<span class="graphNo">24</span>
								<span class="graph">Характер сделки</span>
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:{78*$k}mm;background:#FFFFFF;">
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport">
										<xsl:if test="//ESADout_CU:TransitDirectionCode='ИМ'">
											<xsl:choose>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=10">Морской траспорт </xsl:when>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=20">Железнодорожный транспорт </xsl:when>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=30">Автодорожный траспорт </xsl:when>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=40">Воздушный транспорт </xsl:when>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=50">Почтовое отправление</xsl:when>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=71">Трубопроводный траспорт</xsl:when>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=72">Линии электропередачи</xsl:when>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=80">Внутренний водный транспотр </xsl:when>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=90">Транспортное средство, перемещающееся в качестве товара своим ходом</xsl:when>
												<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode=99">Прочие </xsl:when>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/ESADout_CU:TransportMeansQuantity">
											<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/ESADout_CU:TransportMeansQuantity"/>:</xsl:if>
										<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/ESADout_CU:TransportMeans">
											<xsl:if test="position() &gt; 1">;</xsl:if>
											<xsl:if test="(cat_ru:ActiveTransportIdentifier) and not(cat_ru:TransportIdentifier) ">
												<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
											</xsl:if>
											<xsl:if test="(cat_ru:TransportIdentifier)">
												<xsl:value-of select="cat_ru:TransportIdentifier"/>
											</xsl:if>
											<xsl:if test="(catESAD_cu:FirstTrailerRegId)">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="catESAD_cu:FirstTrailerRegId"/>
											</xsl:if>
											<xsl:if test="(catESAD_cu:SecondTrailerRegId)">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="catESAD_cu:SecondTrailerRegId"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/ESADout_CU:MethodTransport=1">газопровод </xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/ESADout_CU:MethodTransport=2">нефтепровод </xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/ESADout_CU:MethodTransport=3">нефтепродуктопровод </xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/ESADout_CU:MethodTransport=4">линия электропередачи </xsl:when>
								</xsl:choose>
								<xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/ESADout_CU:NameObject"/>
							</td>
							<td align="center" class="graph" style="width:{10*$k}mm;border-bottom:solid 1.5pt black;border-left:solid 2pt black;border-right:solid 1pt black;background:#FFFFFF;">
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportNationalityCode!=''">
										<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportNationalityCode"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td align="center" class="graph" style="width:{7.8*$k}mm;border-left:solid 1pt black;border-bottom:solid 1.5pt black;border-right:solid 2pt black;">
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:ContractCurrencyCode!=''">
										<xsl:value-of select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:ContractCurrencyCode"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td align="center" class="graph" style="width:{29.7*$k}mm;border-right:solid 0.8pt black;">
								<xsl:if test="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:TotalInvoiceAmount!=''">
									<xsl:value-of select="format-number(ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:TotalInvoiceAmount,'0.00')"/>
								</xsl:if>
								<xsl:if test="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:TotalAmount!=''">
									<xsl:text> / </xsl:text>
									<xsl:value-of select="format-number(ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:TotalAmount,'0.00')"/>
								</xsl:if>
							</td>
							<td align="center" class="graph" style="width:{10.4*$k}mm;border-right:solid 0.8pt black;">
								<xsl:apply-templates select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:DealNatureCode"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph" style="width:{10.1*$k}mm;border-right:solid 0.8pt black;">
								<xsl:apply-templates select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:DealFeatureCode"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph" style="width:{9*$k}mm;">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="width:{86*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{18.8*$k}mm;background:#FFFFFF;">
								<span class="graphNo">25</span>
								<span class="graph">Вид транспорта</span>
							</td>
							<td class="graph" colspan="2" style="width:{18.8*$k}mm;border-left:solid 2pt black;border-right:solid 0.8pt black;">
								<span class="graphNo">26</span>
								<span class="graph">Вид транспорта</span>
							</td>
							<td class="graph" style="width:{48.4*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
								<span class="graphNo">27</span>
								<span class="graph">Место погрузки/разгрузки</span>
							</td>
						</tr>
						<tr>
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-bottom:solid 1.5pt black;border-right:solid 2pt black;background:#FFFFFF;">
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode!=''">
										<xsl:value-of select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" style="width:{12.2*$k}mm;background:#FFFFFF;">
								<span class="graph">на границе</span>
							</td>
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 2pt black;border-bottom:solid 1.5pt black;border-right:solid 2pt black;">
								<xsl:choose>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportModeCode!=''">
										<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportModeCode">
											<xsl:value-of select="."/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" style="width:{12.2*$k}mm;border-right:solid 0.8pt black;">
								<span class="graph">внутри страны</span>
							</td>
							<td class="graph" style="width:{48.4*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
								<!--xsl:apply-templates select="ESADout_CU:ESADoutConsigment/ESADout_CU:ESADoutLoadingPlace"/-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
				<td class="graph" colspan="2" rowspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;" valign="top">
					<span class="graphNo">28</span>
					<span class="graph">Финансовые и банковские сведения</span>
					<br/>
				</td>
			</tr>
			<tr>
				<td align="center" class="graphNum" style="width:{17*$k}mm;border:solid 1.5pt black;">
                    1
                </td>
				<td style="width:{86*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{41.4*$k}mm;border-right:solid 0.8pt black;">
								<span class="graphNo">29</span>
								<span class="graph">Орган въезда/выезда</span>
								<br/>
								<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:BorderCustomsOffice">
									<xsl:value-of select="cat_ru:Code"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="cat_ru:OfficeName"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
							</td>
							<td class="graph" style="width:{44.6*$k}mm;border-left:solid 0.8pt black;">
								<span class="graphNo">30</span>
								<span class="graph">Местонахождение товаров</span>
								<br/>
								<xsl:for-each select="ESADout_CU:ESADout_CUGoodsLocation">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="ESADout_CU:InformationTypeCode"/>
									<xsl:if test="ESADout_CU:CustomsOffice">,
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="ESADout_CU:CustomsOffice"/>,
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="ESADout_CU:Address">
										<br/>
										<xsl:apply-templates mode="ru_address" select="ESADout_CU:Address"/>
										<br/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="ESADout_CU:LocationName">
										<xsl:value-of select="ESADout_CU:LocationName"/>
									</xsl:if>,<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="ESADout_CU:GoodsLocationWarehouse">
										<xsl:value-of select="ESADout_CU:GoodsLocationWarehouse/cat_ru:PrDocumentName"/>
										<!--N добавил,  как  в  примере pdp -->
										N<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="ESADout_CU:GoodsLocationWarehouse/cat_ru:PrDocumentNumber"/>
										<xsl:if test="ESADout_CU:GoodsLocationWarehouse/cat_ru:PrDocumentDate">
										от<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates mode="date" select="ESADout_CU:GoodsLocationWarehouse/cat_ru:PrDocumentDate"/>
										</xsl:if>
									,</xsl:if>
									<xsl:if test="ESADout_CU:RegisterDocumentIdDetails/catESAD_cu:DocId">
										<xsl:text> св-во: </xsl:text>
										<xsl:value-of select="ESADout_CU:RegisterDocumentIdDetails/catESAD_cu:DocId"/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="ESADout_CU:GoodsLocationPlace">
										<!--N добавил,  как  в  примере. pdp -->
										N<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="ESADout_CU:GoodsLocationPlace/catESAD_cu:NumberCustomsZone"/>,
									</xsl:if>
									<xsl:if test="ESADout_CU:Transport">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="ESADout_CU:Transport/catESAD_cu:TransporKind"/>:<xsl:for-each select="ESADout_CU:Transport/catESAD_cu:TransporIdentifier">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">;</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<br/>
								</xsl:for-each>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<xsl:apply-templates select="ESADout_CU:ESADout_CUGoods[position() = 1]"/>
		<table cellpadding="0" cellspacing="0" style="width:100%;">
			<tr valign="top">
				<td class="graph" style="border-right:solid 1px black; border-top: solid 1px black; border-bottom: solid 1px black; width: 73px;" valign="top">
					<span class="graphNo">47</span>
					<span class="graphColumn">Исчисление платежей</span>
				</td>
				<td class="graph" style="width: 45%;">
					<xsl:apply-templates mode="payments" select="ESADout_CU:ESADout_CUGoods[position() = 1]"/>
				</td>
				<td class="graph tl tr">
					<table cellpadding="1px" cellspacing="0" style="width: 100%">
						<tr>
							<td class="tb tr" style="width: 50%; vertical-align: top; min-height: 15pt;">
								<span class="graphNo">48</span>
								<span class="graph">Отсрочка платежей</span>
								<xsl:for-each select="//ESADout_CU:ESADout_CUPayments/ESADout_CU:CUDelayPayments">
									<br/>
									<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
									<xsl:text>-</xsl:text>
									<xsl:apply-templates select="catESAD_cu:DelayDocumentNumber"/>
									<xsl:text>-</xsl:text>
									<xsl:apply-templates mode="date" select="catESAD_cu:DelayDocumentDate"/>
									<xsl:text>-</xsl:text>
									<xsl:apply-templates mode="date" select="catESAD_cu:DelayDate"/>
								</xsl:for-each>
							</td>
							<td class="tb" style="vertical-align: top;">
								<span class="graphNo">49</span>
								<span class="graph">Реквизиты склада</span>
							</td>
						</tr>
					</table>
					<span class="graphNo">B</span>
					<span class="graph">ПОДРОБНОСТИ ПОДСЧЕТА</span>
					<table cellpadding="1px" cellspacing="0" style="width:100%;">
						<tr>
							<td class="graph" style="width:{83*$k}mm;" valign="top">
								<xsl:for-each select="ESADout_CU:ESADout_CUPayments/ESADout_CU:ESADout_CUCustomsPayment">
									<xsl:if test="position() > 1">
										<br/>
									</xsl:if>
									<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
									<span class="graph">-</span>
									<xsl:if test="catESAD_cu:PaymentAmount">
										<xsl:value-of select="format-number(catESAD_cu:PaymentAmount,'0.00')"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:PaymentCurrencyCode">
										<span class="graph">-</span>
										<xsl:value-of select="catESAD_cu:PaymentCurrencyCode"/>
									</xsl:if>
									<!--  </xsl:for-each>
                     </td>
                     <td class="graph" style="width:{90*$k}mm;" valign="top">
                        <xsl:for-each select="ESADout_CU:ESADout_CUPayments/ESADout_CU:ESADout_CUCustomsPayment">-->
									<xsl:for-each select="ESADout_CU:PaymentDocument">-<xsl:value-of select="cat_ru:PrDocumentNumber"/>
										<xsl:if test="cat_ru:PrDocumentDate">
											<span class="graph">-</span>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="ESADout_CU:PaymentWayCode">-<xsl:value-of select="ESADout_CU:PaymentWayCode"/>
									</xsl:if>
									<xsl:if test="ESADout_CU:RFOrganizationFeatures">
										<xsl:text>-</xsl:text>
										<xsl:value-of select="ESADout_CU:RFOrganizationFeatures/cat_ru:INN"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ESADout_CU:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
									<xsl:if test="ESADout_CU:RKOrganizationFeatures">-<xsl:value-of select="ESADout_CU:RKOrganizationFeatures/cat_ru:BIN"/>
										<xsl:value-of select="ESADout_CU:RKOrganizationFeatures/cat_ru:IIN"/>
									</xsl:if>
									<xsl:if test="ESADout_CU:RBOrganizationFeatures">-<xsl:value-of select="ESADout_CU:RBOrganizationFeatures/cat_ru:UNP"/>
										<xsl:value-of select="ESADout_CU:RBOrganizationFeatures/cat_ru:RBIdentificationNumber"/>
									</xsl:if>
									<br/>
								</xsl:for-each>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table cellpadding="0" cellspacing="0" style="width:100%;">
			<xsl:if test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUReloadingInfo">
				<tr valign="top">
					<td class="graph" style="border-right: 1px solid black; border-bottom: solid 1px black; border-top: 1px solid black; width: 73px;" valign="top">
						<span class="graphNo">55</span>
						<span class="graphColumn">Перегрузки</span>
					</td>
					<td class="graph" colspan="5" style="background:#FFFFFF;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUReloadingInfo">
									<td>
										<table cellpadding="0" cellspacing="0" style="width:100%;">
											<tr>
												<td class="graph" colspan="3" style="width:{177*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Место и страна:</span>
													<xsl:value-of select="catESAD_cu:ReloadCountryCode"/>
													<xsl:value-of select="catESAD_cu:ReloadCountryName"/>
													<xsl:value-of select="catESAD_cu:ReloadingCustomsOffice/cat_ru:Code"/>
													<xsl:value-of select="catESAD_cu:ReloadingCustomsOffice/cat_ru:OfficeName"/>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{177*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Идентификация и страна регистрации нового транспортного
                                        средства:
                                    </span>
													<xsl:value-of select="catESAD_cu:ReloadingTransportMeans/cat_ru:TransportKindCode"/>,
													<xsl:for-each select="catESAD_cu:ReloadingTransportMeans/cat_ru:TransportIdentifier">
														<xsl:value-of select="."/>,
													</xsl:for-each>
													<xsl:if test="catESAD_cu:ReloadingTransportMeans/cat_ru:VIN">
														<xsl:value-of select="catESAD_cu:ReloadingTransportMeans/cat_ru:VIN"/>,
													</xsl:if>
													<xsl:if test="catESAD_cu:ReloadingTransportMeans/cat_ru:TransportMeansNationalityCode">
														<xsl:value-of select="catESAD_cu:ReloadingTransportMeans/cat_ru:TransportMeansNationalityCode"/>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graph" style="width:{20*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Конт</span>
												</td>
												<td align="center" class="graph" style="width:{10*$k}mm;border:solid 1.5pt black;" valign="top">
													<xsl:value-of select="number(boolean(catESAD_cu:ContainerIndicator))"/>
												</td>
												<td class="graph" style="width:{147*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">(1) Номер нового контейнера </span>
													<xsl:for-each select="catESAD_cu:ReloadContainer/catESAD_cu:ContainerNumber">
														<xsl:value-of select="."/>, 
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{177*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">(1) Указывается 1, если ДА или 0, если НЕТ</span>
												</td>
											</tr>
										</table>
									</td>
								</xsl:for-each>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="(..//ESADout_CU:CustomsProcedure = 'ТТ') or (..//ESADout_CU:CustomsProcedure = 'TT') ">
				<tr valign="top">
					<td class="graph" style="width:{13*$k}mm;border-right:solid 0.8pt black;" valign="top"/>
					<td class="graph" colspan="5" style="width:{177*$k}mm;border:solid 0.8pt black;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<td class="graph" style="width:{40*$k}mm;background:#FFFFFF;">
									<span class="graphNo">50</span>
									<span class="graph">Принципал</span>
								</td>
								<td class="graph" style="width:{60*$k}mm;background:#FFFFFF;">
									<span class="graph">№</span>
									<!--xsl:value-of select="ESADout_CU:ESADoutPrincipal/cat_ru:OGRN"/-->
								</td>
								<td class="graph" style="width:{20*$k}mm;background:#FFFFFF;">
									<span class="graph">Подпись:</span>
								</td>
								<td class="graph" rowspan="4" style="width:{57*$k}mm;border-left:solid 0.8pt black;" valign="top">
									<span class="graphNo">С</span>
									<span class="graph">ОРГАН ОТПРАВЛЕНИЯ</span>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{120*$k}mm;background:#FFFFFF;">
                        </td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{120*$k}mm;background:#FFFFFF;">
									<span class="graph">представленный </span>
									<xsl:if test="(..//ESADout_CU:CustomsProcedure = 'ТТ') or(..//ESADout_CU:CustomsProcedure = 'TT') ">
										<xsl:for-each select="ESADout_CU:ESADout_CUDeclarant">
											<xsl:value-of select="cat_ru:OrganizationName"/>
											<xsl:if test="cat_ru:ShortName">
												<span class="graph">(</span>
												<xsl:value-of select="cat_ru:ShortName"/>
												<span class="graph">)</span>
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
												<xsl:apply-templates mode="ru_address" select="."/>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:text> </xsl:text>
										<xsl:if test="ESADout_CU:ESADout_CUCarrier"> перевозчик
											<xsl:for-each select="ESADout_CU:ESADout_CUCarrier">
												<xsl:value-of select="cat_ru:OrganizationName"/>
												<xsl:if test="cat_ru:ShortName">
													<span class="graph">(</span>
													<xsl:value-of select="cat_ru:ShortName"/>
													<span class="graph">)</span>
												</xsl:if>
												<xsl:text> </xsl:text>
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
													<xsl:apply-templates mode="ru_address" select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:if>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{120*$k}mm;background:#FFFFFF;">
									<span class="graph">Место и дата:</span>
									<xsl:if test="(..//ESADout_CU:CustomsProcedure = 'ТТ') or(..//ESADout_CU:CustomsProcedure = 'TT') ">
										<xsl:value-of select="..//ESADout_CU:ExecutionPlace"/>
										<xsl:text> </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="..//ESADout_CU:EECEDocHeaderAddInfo/RUScat_ru:EDocDateTime"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="not(ESADout_CU:ESADout_CUCarrier)">
				<tr valign="top">
					<td class="graph" colspan="6">
						<table cellpadding="0" cellspacing="0" style="width:100%;border-bottom:solid 0.8pt black;">
							<tr>
								<td class="graph" style="width:{13*$k}mm;border-right:solid 0.8pt black;border-top:solid 0.8pt black;black;border-bottom:solid 0.8pt black;" valign="top">
									<span class="graphNo">51</span>
									<span class="graphColumn">Предполагаемые органы  (и страна) транзита</span>
								</td>
								<td class="graph" colspan="5" style="border-right:solid 0.8pt black;border-top:solid 0.8pt black;black;border-bottom:solid 0.8pt black;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:if>
			<tr valign="top">
				<td class="graph" colspan="6">
					<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
						<tr>
							<xsl:choose>
								<xsl:when test="(..//ESADout_CU:CustomsProcedure = 'ТТ') or (..//ESADout_CU:CustomsProcedure = 'TT')">
									<td class="graph" rowspan="2" style="width:{13*$k}mm;border-bottom:solid 0.8pt black;border-top:solid 0.8pt black;" valign="top">
										<span class="graphNo">52</span>
										<span class="graphColumn">Гарантия</span>
									</td>
									<td class="graph" rowspan="2" style="width:{110*$k}mm;border-top:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;" valign="top">
										<xsl:choose>
											<xsl:when test="ESADout_CU:TDGuarantee">
												<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:DocNumber"> № 
											<xsl:value-of select="ESADout_CU:TDGuarantee/catESAD_cu:DocNumber"/>
												</xsl:if>
												<!--xsl:value-of select="ESADout_CU:TDGuarantee/catESAD_cu:DocDate"/--> от
											<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="ESADout_CU:TDGuarantee/catESAD_cu:DocDate"/>
												</xsl:call-template>
												<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:GuaranteeName">
											БИК <xsl:value-of select="ESADout_CU:TDGuarantee/catESAD_cu:GuaranteeName"/>, 
										</xsl:if>
												<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:UNP">
											 УНП <xsl:value-of select="ESADout_CU:TDGuarantee/catESAD_cu:UNP"/>, 
										</xsl:if>
												<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:BIC">
											БИК <xsl:value-of select="ESADout_CU:TDGuarantee/catESAD_cu:BIC"/>, 
										</xsl:if>
												<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:GuaranteeAmount">
													<xsl:text>, сумма: </xsl:text>
													<xsl:value-of select="ESADout_CU:TDGuarantee/catESAD_cu:GuaranteeAmount"/>
												</xsl:if>
											</xsl:when>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="graph" rowspan="2" style="width:{13*$k}mm;border-top:solid 0.8pt " valign="top">
										<span class="graphNo">52</span>
										<span class="graphColumn">Гарантия недействительна для</span>
									</td>
									<td class="graph" rowspan="2" style="width:{110*$k}mm;border-top:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;" valign="top">
										<xsl:choose>
											<xsl:when test="ESADout_CU:Guarantee">
												<xsl:for-each select="ESADout_CU:Guarantee">
													<xsl:if test="catESAD_cu:PaymentWayCode">
														<xsl:value-of select="catESAD_cu:PaymentWayCode"/>, 
													</xsl:if>
													<xsl:value-of select="catESAD_cu:Amount"/>, 
													<xsl:if test="catESAD_cu:GuaranteeDocDetails">
														<xsl:for-each select="catESAD_cu:GuaranteeDocDetails">
															<xsl:if test="cat_ru:PrDocumentNumber">
																<xsl:text> № </xsl:text>
																<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															</xsl:if>
															<xsl:if test="cat_ru:PrDocumentDate">
																<xsl:text> от </xsl:text>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="cat_ru:PrDocumentNumber"/>
																</xsl:call-template>
															</xsl:if>
															<xsl:if test="position()!=last()">, </xsl:if>
														</xsl:for-each>
													</xsl:if>
													<xsl:if test="catESAD_cu:UNP">
														<xsl:text> УНП </xsl:text>
														<xsl:value-of select="catESAD_cu:UNP"/>, 
													</xsl:if>
													<xsl:if test="catESAD_cu:BIC">
														<xsl:text> БИК </xsl:text>
														<xsl:value-of select="catESAD_cu:BIC"/>, 
													</xsl:if>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</xsl:when>
										</xsl:choose>
									</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="graph" style="width:{10*$k}mm;border-right:solid 1pt black;background:#FFFFFF;vertical-align: bottom;">
								<span class="graph">Код</span>
								<br/>
							</td>
							<td class="graph" rowspan="2" style="width:{60*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;" valign="top">
								<span class="graphNo">53</span>
								<span class="graph">Орган (и страна) назначения</span>
								<br/>
								<xsl:if test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:TDDeliveryPlace/ESADout_CU:DeliveryCustomsOffice">
									<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:TDDeliveryPlace/ESADout_CU:DeliveryCustomsOffice/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:{10*$k}mm;border-left:solid 1.5pt black;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;vertical-align: bottom;">
								<xsl:value-of select="ESADout_CU:TDGuarantee/catESAD_cu:MeasureCode"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td class="graph" colspan="6" style="width:{190*$k}mm;border-top:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" style="width:100%;">
						<tr>
							<td class="graph" style="width:{43*$k}mm;">
								<span class="graphNo">D</span>
								<!--span class="graph">ОТМЕТКИ ТАМОЖЕННОГО ОРГАНА ОТПРАВЛЕНИЯ/НАЗНАЧЕНИЯ</span-->
							</td>
							<td class="graph" style="width:{60*$k}mm;"/>
							<td class="graph" style="width:{20*$k}mm;border-right:solid 0.8pt black;">
								<span class="graph">Печать:</span>
							</td>
							<td class="graph" rowspan="6" style="width:{67*$k}mm;border-left:solid 0.8pt black;">
								<span class="graphNo">54</span>
								<span class="graph">Место и дата</span>
								<br/>
								<!--xsl:for-each select="ESADout_CU:ESADout_CUFilledPerson"-->
								<xsl:for-each select="//ESADout_CU:CUESADCustomsRepresentative">
									<!--Пункт 1)-->
									<span class="graph">1) </span>
										Свид. о включении в Реестр таможенных представителей № <xsl:value-of select="RUDECLcat:BrokerRegistryDocDetails/RUDECLcat:RegisterDocumentDetails/RUScat_ru:RegistrationNumberId"/>;<br/>
									<xsl:for-each select="RUDECLcat:RepresentativeContractDetails">
											Договор таможенного представителя с декларантом № 
											 <xsl:value-of select="cat_ru:PrDocumentNumber"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="cat_ru:PrDocumentDate">
											от 
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>; <br/>
										<xsl:choose>
											<xsl:when test="RUDECLcat:RFOrganizationFeatures">
												<xsl:for-each select="RUDECLcat:RFOrganizationFeatures">
													<xsl:if test="cat_ru:OGRN">
														<xsl:value-of select="cat_ru:OGRN"/>
														<xsl:if test="cat_ru:INN">/</xsl:if>
													</xsl:if>
													<xsl:if test="cat_ru:INN">
														<xsl:value-of select="cat_ru:INN"/>
														<xsl:if test="cat_ru:KPP"/>
													</xsl:if>
													<xsl:if test="cat_ru:KPP">
														/ <xsl:value-of select="cat_ru:KPP"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:when>
											<xsl:when test="RUDECLcat:RKOrganizationFeatures">
												<xsl:for-each select="RUDECLcat:RKOrganizationFeatures">
													<xsl:if test="cat_ru:BIN">
														<xsl:value-of select="cat_ru:BIN"/>
														<xsl:if test="cat_ru:IIN">/</xsl:if>
													</xsl:if>
													<xsl:if test="cat_ru:IIN">
														<xsl:value-of select="cat_ru:IIN"/>
														<xsl:if test="cat_ru:ITN">/</xsl:if>
													</xsl:if>
													<xsl:for-each select="cat_ru:ITN">
														<xsl:value-of select="cat_ru:CategoryCode"/>/
														<xsl:value-of select="cat_ru:KATOCode"/>/
														<xsl:value-of select="cat_ru:RNN"/>
														<xsl:if test="cat_ru:ITNReserv">
															/<xsl:value-of select="cat_ru:ITNReserv"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:when>
											<xsl:when test="RUDECLcat:RBOrganizationFeatures">
												<xsl:for-each select="RUDECLcat:RBOrganizationFeatures">
													<xsl:if test="cat_ru:UNP">
														<xsl:value-of select="cat_ru:UNP"/>
														<xsl:if test="cat_ru:RBIdentificationNumber">/</xsl:if>
													</xsl:if>
													<xsl:if test="cat_ru:RBIdentificationNumber">
														<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
									<br/>
								</xsl:for-each>
								<br/>
								<span class="graph">Подпись и фамилия декларанта/представителя</span>
								<br/>
								<!--xsl:apply-templates select="//ESADout_CU:FilledPerson" mode="per"/-->
								<xsl:for-each select="//ESADout_CU:FilledPerson">
									<!--Пункт 2)-->
									<span class="graph">2)</span>
									<xsl:value-of select="RUDECLcat:SigningDetails/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="RUDECLcat:SigningDetails/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="RUDECLcat:SigningDetails/cat_ru:PersonMiddleName"/>
									<xsl:text> </xsl:text>
									<br/>
									<xsl:for-each select="RUDECLcat:SignatoryPersonIdentityDetails">
										<xsl:text> </xsl:text>
										<xsl:value-of select="RUScat_ru:IdentityCardName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
										<xsl:text> </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
										</xsl:call-template>
										<xsl:text> </xsl:text>
										<xsl:value-of select="RUScat_ru:OrganizationName"/>
										<br/>
									</xsl:for-each>
									<xsl:if test="RUDECLcat:SigningDetails/cat_ru:PersonPost">
										<xsl:value-of select="RUDECLcat:SigningDetails/cat_ru:PersonPost"/>
										<br/>
									</xsl:if>
									<xsl:for-each select="RUDECLcat:SigningDetails/RUScat_ru:CommunicationDetails">
											Телефон <xsl:for-each select="cat_ru:Phone">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<br/>
									</xsl:for-each>
									<!--Графа 3)-->
									<xsl:for-each select="RUDECLcat:PowerOfAttorneyDetails">
										<span class="graph">3)</span>
										<xsl:if test="cat_ru:PrDocumentName">
											<xsl:value-of select="cat_ru:PrDocumentName"/>, 
											</xsl:if>
										<xsl:value-of select="cat_ru:PrDocumentNumber"/>, 
											<xsl:if test="cat_ru:PrDocumentDate">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="RUScat_ru:DocValidityDate">
											<span class="graph">до </span>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="RUScat_ru:DocValidityDate"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
									</xsl:for-each>
								</xsl:for-each>
								<!--Графа 4)-->
								<xsl:if test="//ESADout_CU:RegNumberDoc">
									<span class="graph">4)  Исходящий номер регистрации документов</span>
									<br/>
								</xsl:if>
								<xsl:value-of select="//ESADout_CU:RegNumberDoc"/>
								<xsl:text> </xsl:text>
								<br/>
								<xsl:if test="//ESADout_CU:SecurityLabelCode"> Код защитной наклейки
										<xsl:value-of select="//ESADout_CU:SecurityLabelCode"/>
								</xsl:if>
								<p align="right">
									<xsl:choose>
										<xsl:when test="(//ESADout_CU:CustomsProcedure ='TT') or (//ESADout_CU:CustomsProcedure ='ТТ')">
											<xsl:text> </xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="//ESADout_CU:EECEDocHeaderAddInfo/RUScat_ru:EDocDateTime"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</p>
								<br/>
								<!--/xsl:for-each-->
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
								<span class="graph">Результат:</span>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="3" style="width:{43*$k}mm; border-right:solid 0.8pt black;">
								<span class="graph">Наложенные пломбы:</span>
							</td>
							<td/>
						</tr>
						<tr>
							<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
								<span class="graph">Номер:</span>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
								<span class="graph">Срок доставки (дата):</span>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
								<span class="graph">Подпись:</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!--Товар-->
	<xsl:template match="ESADout_CU:ESADout_CUGoods">
		<div class="goods">
			<xsl:attribute name="id"><xsl:text>generate-id(.)</xsl:text></xsl:attribute>
			<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
				<tr>
					<td class="graph" rowspan="3" style="width:68px; border-right:solid 0.8pt black;border-top:solid 0.8pt black;" valign="top">
						<span class="graphNo">31</span>
						<span class="graphColumn">Грузовые места<br/>и описание<br/>товаров</span>
					</td>
					<td class="graph" style="width:{98.8*$k}mm;border-top:solid 0.8pt black;background:#FFFFFF;" valign="top">
						<span class="graph">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</span>
					</td>
					<td class="graph" style="width:{11*$k}mm; border-top:solid 0.8pt black; background:#FFFFFF;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<td class="graph" colspan="2" style="width:{11*$k}mm; border-left:solid 2pt black;">
									<span class="graphNo">32</span>
									<span class="graph">Товар</span>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 2pt black;border-bottom:solid 2pt black;border-right:solid 2pt black;">
									<xsl:choose>
										<xsl:when test="catESAD_cu:GoodsNumeric!=''">
											<xsl:value-of select="catESAD_cu:GoodsNumeric"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td style="width:{4.4*$k}mm;border-bottom:solid 0.8pt black;">
									<span class="graph">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>№
                                       <xsl:value-of select="catESAD_cu:GoodFeatures"/>
									</span>
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="graph" style="width:{20.6*$k}mm;border-top:solid 0.8pt black;border-left:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;">
						<span class="graphNo">33</span>
						<span class="graph">Код товара</span>
						<br/>
						<xsl:value-of select="substring(catESAD_cu:GoodsTNVEDCode,1,10)"/>
					</td>
					<td class="graph" colspan="2" style="border:solid 0.8pt black; vertical-align: bottom;">
						<table cellpadding="0" cellspacing="0" style="width:100%; vertical-align:bottom;">
							<tr class="graph" align="center">
								<td colspan="2" style="width:{23.8*$k}mm; border-right:solid 0.8pt black;">
									<br/>
								</td>
								<td style="width:{7*$k}mm; border-right:solid 0.8pt black; ">
									<br/>
								</td>
								<td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;">
									<br/>
								</td>
							</tr>
							<tr class="graph" align="center">
								<td style="width:{7*$k}mm; border-right:solid 0.8pt black;">
									<xsl:if test="catESAD_cu:AdditionalSign">
										<xsl:value-of select="catESAD_cu:AdditionalSign"/>
									</xsl:if>
								</td>
								<td style="width:{17.8*$k}mm; border-right:solid 0.8pt black;">
									<xsl:choose>
										<xsl:when test="catESAD_cu:IntellectPropertySign">
											<xsl:value-of select="catESAD_cu:IntellectPropertySign"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td style="width:{7*$k}mm; border-right:solid 0.8pt black; ">
									<xsl:choose>
										<xsl:when test="catESAD_cu:GoodsClassificationCode=1">О</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;">
									<xsl:choose>
										<xsl:when test="catESAD_cu:GoodsAddTNVEDCode!=''">
											<xsl:value-of select="catESAD_cu:GoodsAddTNVEDCode"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="graph" colspan="2" rowspan="2" style="width:{122.8*$k}mm; border-bottom:solid 0.8pt black; background:#FFFFFF;word-break: break-all;" valign="top">
						<span class="graph">1)</span>
						<xsl:if test="ESADout_CU:MilitaryProducts ='true' or ESADout_CU:MilitaryProducts ='t' or ESADout_CU:MilitaryProducts ='1'">
                               Продукция военного назначения
                            </xsl:if>
						<xsl:for-each select="catESAD_cu:GoodsDescription">
							<xsl:value-of select="."/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:for-each>
						<!--xsl:if test="catESAD_cu:GoodsDescription and catESAD_cu:GoodsGroupDescription"><br/></xsl:if-->
						<!-- Сначала описание без характеристик групп -->
						<xsl:for-each select="catESAD_cu:GoodsGroupDescription[not (catESAD_cu:GoodsGroupInformation)]">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:for-each select="catESAD_cu:GoodsDescription">
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="catESAD_cu:GoodsGroupDescription[catESAD_cu:GoodsGroupInformation]">
							<br/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:for-each select="catESAD_cu:GoodsDescription">
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
							<xsl:if test="catESAD_cu:ObjectOrdinal"> / <xsl:value-of select="catESAD_cu:ObjectOrdinal"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:if>
							<xsl:if test="catESAD_cu:RKTNVED">
								<xsl:value-of select="catESAD_cu:RKTNVED"/>
							</xsl:if>
							<xsl:for-each select="catESAD_cu:GoodsGroupInformation">
								<xsl:if test="catESAD_cu:Manufacturer">
									<xsl:text> Производитель </xsl:text>
									<xsl:value-of select="catESAD_cu:Manufacturer"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:TradeMark">
									<xsl:text> Тов.знак </xsl:text>
									<xsl:value-of select="catESAD_cu:TradeMark"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsMark">
									<xsl:text> Торг. знак, марка </xsl:text>
									<xsl:value-of select="catESAD_cu:GoodsMark"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsModel">
									<xsl:text> Модель </xsl:text>
									<xsl:value-of select="catESAD_cu:GoodsModel"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsMarking">
									<xsl:text> Артикул</xsl:text>
									<xsl:value-of select="catESAD_cu:GoodsMarking"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsStandard">
									<xsl:text> Стандарт </xsl:text>
									<xsl:value-of select="catESAD_cu:GoodsStandard"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsSort">
									<xsl:text> Сорт: </xsl:text>
									<xsl:value-of select="catESAD_cu:GoodsSort"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:WoodDescriptionDetails">
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment">
										<xsl:text> Наим.сортимента: </xsl:text>
										<xsl:value-of select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind">
										<xsl:text> Порода древесины: </xsl:text>
										<xsl:value-of select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName">
										<xsl:text> Наименование сорта:</xsl:text>
										<xsl:value-of select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails">
										<xsl:text> Припуск по длине, ширине, высоте: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails">
										<xsl:text> Отклонения по длине, ширине, высоте: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
										<xsl:text> Диапазон диаметров: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MinRangeMeasure" mode="SupplementaryQuantity"/>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure"> - <xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure" mode="SupplementaryQuantity"/>
										</xsl:if>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure">
										<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure" mode="SupplementaryQuantity"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure">
										<xsl:text> Фактический объем товара: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure" mode="SupplementaryQuantity"/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="catESAD_cu:Dimensions">
									<xsl:text> Размеры </xsl:text>
									<xsl:apply-templates select="catESAD_cu:Dimensions"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:DateIssue">
									<xsl:text> Дата выпуска </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="catESAD_cu:SerialNumber">
									<xsl:text> Серийный номер: </xsl:text>
									<xsl:for-each select="catESAD_cu:SerialNumber">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsGroupQuantity">
									<xsl:text> Кол-во </xsl:text>
									<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_ru:GoodsQuantity"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
						</xsl:for-each>
						<br/>
						<xsl:if test="catESAD_cu:OilField"> Месторождения товара:
							<xsl:apply-templates select="catESAD_cu:OilField"/>
						</xsl:if>
						<xsl:if test="catESAD_cu:OriginCountryName">
							<br/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="catESAD_cu:OriginCountryName"/>
						</xsl:if>
						<xsl:if test="ESADout_CU:SupplementaryGoodsQuantity">
							<br/>
							<xsl:value-of select="ESADout_CU:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="ESADout_CU:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="ESADout_CU:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
						</xsl:if>
						<xsl:for-each select="ESADout_CU:SupplementaryGoodsQuantity1">
							<br/>
							<xsl:value-of select="cat_ru:GoodsQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
						</xsl:for-each>
						<xsl:if test="(catESAD_cu:BeginPeriodDate!='') or (catESAD_cu:EndPeriodDate!='')">
							<br/>
							<xsl:if test="catESAD_cu:BeginPeriodDate">
								<span class="graph">Начало периода</span>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="catESAD_cu:BeginPeriodDate"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="catESAD_cu:EndPeriodDate">
								<span class="graph">Окончание периода</span>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="catESAD_cu:EndPeriodDate"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
						<xsl:if test="catESAD_cu:IPObjectRegistryNum">
							<xsl:if test="count(catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']) &gt; 0">
								<br/>
								<span class="graph">Единый ТРОИС ЕАЭС: </span>
								<xsl:for-each select="catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']">
									<xsl:if test="catESAD_cu:CountryCode">
										<span class="graph">(</span>
										<xsl:value-of select="catESAD_cu:CountryCode"/>
										<span class="graph">) </span>
									</xsl:if>
									<xsl:value-of select="catESAD_cu:IPORegistryNumber"/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="count(catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']) &gt; 0">
								<br/>
								<span class="graph">Национальный ТРОИС: </span>
								<xsl:for-each select="catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']">
									<xsl:if test="catESAD_cu:CountryCode">
										<span class="graph">(</span>
										<xsl:value-of select="catESAD_cu:CountryCode"/>
										<span class="graph">) </span>
									</xsl:if>
									<xsl:value-of select="catESAD_cu:IPORegistryNumber"/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</xsl:if>
						</xsl:if>
						<xsl:if test="ESADout_CU:ESADGoodsPackaging">
							<br/>
							<span class="graph">2)</span>
							<!--xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=1"-->
							<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakageQuantity!=''">
								<xsl:value-of select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakageQuantity"/>&#160;
								<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity">
                                        (<xsl:value-of select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity"/>-часть
                                        места)
                           <!--/xsl:if-->
                                    ,
                                </xsl:if>
								<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0']">
									<xsl:for-each select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0']">
										<xsl:value-of select="catESAD_cu:PalleteCode"/>
										<xsl:if test="catESAD_cu:PalleteQuantity">
											<span class="graph">-</span>
											<xsl:value-of select="catESAD_cu:PalleteQuantity"/>
										</xsl:if>
										<span class="graph">,</span>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
                                    Поддоны:
									<xsl:for-each select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
										<xsl:if test="catESAD_cu:CargoDescriptionText">
											<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
										</xsl:if>
										<span class="graph">,</span>
										<xsl:value-of select="catESAD_cu:PalleteQuantity"/> /
										<xsl:value-of select="catESAD_cu:PalleteCode"/>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
									<br/>2.1
									<xsl:for-each select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
										<xsl:value-of select="catESAD_cu:PalleteCode"/>
										<xsl:if test="catESAD_cu:PalleteQuantity">
											<span class="graph">-</span>
											<xsl:value-of select="catESAD_cu:PalleteQuantity"/>
										</xsl:if>
										<span class="graph">,</span>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=0">
                                без упаковки
                            </xsl:if>
							<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=2">
                                без упаковки/
								<xsl:for-each select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='2']">
									<xsl:value-of select="catESAD_cu:PalleteCode"/>
									<span class="graph">,</span>
								</xsl:for-each>
							</xsl:if>
						</xsl:if>
						<xsl:if test="ESADout_CU:ESADContainer">
							<br/>
							<span class="graph">3) </span>
							<xsl:for-each select="ESADout_CU:ESADContainer">
								<xsl:value-of select="catESAD_cu:ContainerQuantity"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:ContainerNumber">
									<xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>
									<xsl:if test="catESAD_cu:FullIndicator='2'">
										<span class="graph">часть</span>
									</xsl:if>
									<span class="graph">,</span>
								</xsl:for-each>
								<xsl:if test="position()!=last()">
									<span class="graph">; </span>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="ESADout_CU:ESADExcise">
							<br/>
							<span class="graph">4) </span>
							<xsl:for-each select="ESADout_CU:ESADExcise">
								<xsl:value-of select="catESAD_cu:ExciseSerieses"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:ExciseList">
									<xsl:for-each select="catESAD_cu:ExciseNumber">
										<xsl:value-of select="."/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="catESAD_cu:ExciseRange">
									<xsl:value-of select="catESAD_cu:ExciseFirstNumber"/>
									<xsl:text disable-output-escaping="yes">-</xsl:text>
									<xsl:value-of select="catESAD_cu:ExciseLastNumber"/>
									<xsl:if test="position()!=last()">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:if>
								</xsl:for-each>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:value-of select="catESAD_cu:ExciseQuantity"/>
								<span class="graph">;</span>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="catESAD_cu:CUESADDeliveryTerms">
							<br/>
							<span class="graph">5) </span>
							<xsl:for-each select="catESAD_cu:CUESADDeliveryTerms">
								<xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="cat_ru:DeliveryPlace"> - 
									<xsl:value-of select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="cat_ru:TransferPlace">
									<xsl:value-of select="cat_ru:TransferPlace"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions">
							<br/>
							<span class="graph">6) </span>
							<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:RateOutputGoods">
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
							<br/>
							<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct">
							Продукт переработки:
							<xsl:value-of select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct/catESAD_cu:GoodsTNVEDCode"/>
								<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct/catESAD_cu:GoodsDescription">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct/catESAD_cu:ProcessingGoodsQuantity">
									<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct/catESAD_cu:ProcessingGoodsQuantity">
										<xsl:value-of select="cat_ru:GoodsQuantity"/>
										<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
											(<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>) 
										</xsl:if>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<br/>
							<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts">
							Отходы:
							<xsl:value-of select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts/catESAD_cu:GoodsTNVEDCode"/>
								<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts/catESAD_cu:GoodsDescription">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts/catESAD_cu:ProcessingGoodsQuantity">
									<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts/catESAD_cu:ProcessingGoodsQuantity">
										<xsl:value-of select="cat_ru:GoodsQuantity"/>
										<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
											(<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>) 
										</xsl:if>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<br/>
							<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels">
							Остатки:
							<xsl:value-of select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels/catESAD_cu:GoodsTNVEDCode"/>
								<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels/catESAD_cu:GoodsDescription">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels/catESAD_cu:ProcessingGoodsQuantity">
									<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels/catESAD_cu:ProcessingGoodsQuantity">
										<xsl:value-of select="cat_ru:GoodsQuantity"/>
										<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
											(<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>) 
										</xsl:if>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<br/>
							<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:GoodsIdentificationMethod">
							Способ идентификации:
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
							<br/>
							<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Substitute">
							Сведения о замене иностранных товаров эквивалентными товарами:
							<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Substitute">
									<xsl:value-of select="."/>
								</xsl:for-each>
							</xsl:if>
						</xsl:if>
						<xsl:if test="(catESAD_cu:DeliveryTime) or (catESAD_cu:DeliveryTimeEND)">
							<br/>
							<span class="graph">7) Поставка в период</span> с
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="catESAD_cu:DeliveryTime"/>
							</xsl:call-template>
							<xsl:if test="catESAD_cu:DeliveryTimeEND">
								по <xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="catESAD_cu:DeliveryTimeEND"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
						<xsl:if test="catESAD_cu:QuantityFact/cat_ru:GoodsQuantity">
							<br/>
							<span class="graph">8) </span>
							<xsl:value-of select="catESAD_cu:QuantityFact/cat_ru:GoodsQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="catESAD_cu:QuantityFact/cat_ru:MeasureUnitQualifierName"/>
							<xsl:if test="catESAD_cu:QuantityFact/cat_ru:MeasureUnitQualifierCode">
								<xsl:text> (</xsl:text>
								<xsl:value-of select="catESAD_cu:QuantityFact/cat_ru:MeasureUnitQualifierCode"/>
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
						<xsl:if test="(ESADout_CU:ElectricalEnergReceived) or (ESADout_CU:ElectricalEnergGiven)">
							<br/>
							<span class="graph">9) </span>
							<xsl:for-each select="ESADout_CU:ElectricalEnergReceived">
								принято <xsl:value-of select="catESAD_cu:ElectricalEnergyQuantity"/> тыс. кВт.ч
								<xsl:if test="catESAD_cu:QualifierCode">
									(<xsl:value-of select="catESAD_cu:QualifierCode"/>)
								</xsl:if>, 
							</xsl:for-each>
							<xsl:for-each select="ESADout_CU:ElectricalEnergGiven">
								отдано <xsl:value-of select="catESAD_cu:ElectricalEnergyQuantity"/> тыс. кВт.ч
								<xsl:if test="catESAD_cu:QualifierCode">
									(<xsl:value-of select="catESAD_cu:QualifierCode"/>)
								</xsl:if>, 
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="catESAD_cu:CIMIdDetails">
							<br/>
							<span class="graph">10) </span>
							<xsl:for-each select="catESAD_cu:CIMIdDetails">
						Контрольные знаки
						<xsl:if test="catESAD_cu:CIMMarkingFlag">
							Признак: <xsl:value-of select="catESAD_cu:CIMMarkingFlag"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:CIMQuantity">
							Количество: <xsl:value-of select="catESAD_cu:CIMQuantity"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:CIMList">
							Идентификаторы: 
							<xsl:for-each select="catESAD_cu:CIMList/catESAD_cu:CIMID">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="catESAD_cu:CIMRange">
							 Диапазоны: 
							 <xsl:for-each select="catESAD_cu:CIMRange">
										<xsl:value-of select="catESAD_cu:FirstCIMID"/> - <xsl:value-of select="catESAD_cu:LastCIMID"/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:for-each select="catESAD_cu:GoodsSTZ">
							<br/>
							<span class="graph">11) </span>
							<br/>
							Номер строки в гр 40 <xsl:value-of select="catESAD_cu:LineNumber"/>
							<br/>
							<xsl:for-each select="catESAD_cu:GoodsDescription">
								<xsl:value-of select="."/>
							</xsl:for-each>
							Кол-во 
							<xsl:for-each select="catESAD_cu:SupplementaryQuantity">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:value-of select="cat_ru:GoodsQuantity"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
								<xsl:if test="cat_ru:MeasureUnitQualifierCode">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(
                                    <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
                                </xsl:if>
							</xsl:for-each>
							<!-- Сначала описание без характеристик групп -->
							<xsl:for-each select="catESAD_cu:GoodsGroupDescription[not (catESAD_cu:GoodsGroupInformation)]">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:GoodsDescription">
									<xsl:value-of select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="catESAD_cu:GoodsGroupDescription[catESAD_cu:GoodsGroupInformation]">
								<br/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:GoodsDescription">
									<xsl:value-of select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="catESAD_cu:ObjectOrdinal"> / <xsl:value-of select="catESAD_cu:ObjectOrdinal"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:if>
								<xsl:if test="catESAD_cu:RKTNVED">
									<xsl:value-of select="catESAD_cu:RKTNVED"/>
								</xsl:if>
								<xsl:for-each select="catESAD_cu:GoodsGroupInformation">
									<xsl:if test="catESAD_cu:Manufacturer">
										<xsl:text> Производитель </xsl:text>
										<xsl:value-of select="catESAD_cu:Manufacturer"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:TradeMark">
										<xsl:text> Тов.знак </xsl:text>
										<xsl:value-of select="catESAD_cu:TradeMark"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsMark">
										<xsl:text> Торг. знак, марка </xsl:text>
										<xsl:value-of select="catESAD_cu:GoodsMark"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsModel">
										<xsl:text> Модель </xsl:text>
										<xsl:value-of select="catESAD_cu:GoodsModel"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsMarking">
										<xsl:text> Артикул</xsl:text>
										<xsl:value-of select="catESAD_cu:GoodsMarking"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsStandard">
										<xsl:text> Стандарт </xsl:text>
										<xsl:value-of select="catESAD_cu:GoodsStandard"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsSort">
										<xsl:text> Сорт: </xsl:text>
										<xsl:value-of select="catESAD_cu:GoodsSort"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails">
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment">
											<xsl:text> Наим.сортимента: </xsl:text>
											<xsl:value-of select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind">
											<xsl:text> Порода древесины: </xsl:text>
											<xsl:value-of select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName">
											<xsl:text> Наименование сорта:</xsl:text>
											<xsl:value-of select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails">
											<xsl:text> Припуск по длине, ширине, высоте: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails">
											<xsl:text> Отклонения по длине, ширине, высоте: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
											<xsl:text> Диапазон диаметров: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MinRangeMeasure" mode="SupplementaryQuantity"/>
											<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure"> - <xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure" mode="SupplementaryQuantity"/>
											</xsl:if>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure">
											<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure" mode="SupplementaryQuantity"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure">
											<xsl:text> Фактический объем товара: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure" mode="SupplementaryQuantity"/>
										</xsl:if>
									</xsl:if>
									<xsl:if test="catESAD_cu:Dimensions">
										<xsl:text> Размеры </xsl:text>
										<xsl:apply-templates select="catESAD_cu:Dimensions"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:DateIssue">
										<xsl:text> Дата выпуска </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="catESAD_cu:SerialNumber">
										<xsl:text> Серийный номер: </xsl:text>
										<xsl:for-each select="catESAD_cu:SerialNumber">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsGroupQuantity">
										<xsl:text> Кол-во </xsl:text>
										<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:value-of select="cat_ru:GoodsQuantity"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
											<xsl:if test="cat_ru:MeasureUnitQualifierCode">
												<xsl:text> (</xsl:text>
												<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</td>
					<td colspan="3" style="width:{67.2*$k}mm; vertical-align: top; border-right:solid 0.8pt black;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr class="graph" align="left" style="vertical-align: top">
								<td width="3%"/>
								<td width="14%"/>
								<td width="3%"/>
								<td width="11%"/>
								<td width="46%"/>
								<td width="23%"/>
							</tr>
							<tr class="graph" align="left" style="vertical-align: top">
								<!--td colspan="4" style="width:{20.6*$k}mm; border-left:solid 1.5pt black; border-right:solid 1.5pt black;"-->
								<td colspan="4" style="border-left:solid 1.5pt black; border-right:solid 1.5pt black;">
									<span class="graphNo">34</span>
									<span class="graph">Код страны происх.</span>
								</td>
								<!--td style="width:{30.8*$k}mm; border-right:solid 0.8pt black;"-->
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">35</span>
									<span class="graph">Вес брутто (кг)</span>
								</td>
								<!--td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;"-->
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">36</span>
									<span class="graph">Преференция</span>
								</td>
							</tr>
							<tr class="graph" align="center" style="vertical-align: bottom">
								<!--td style="width:{2.2*$k}mm;border-left:solid 1.5pt black;border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;">a</td-->
								<td style="border-left:solid 1.5pt black;border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;word-break: break-all;">a</td>
								<!--td style="width:{9.6*$k}mm; border-right:solid 0.8pt black; border-bottom:solid 1.5pt black;"-->
								<td style="border-right:solid 0.8pt black; border-bottom:solid 1.5pt black;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:choose>
										<xsl:when test="catESAD_cu:OriginCountryCode!=''">
											<xsl:value-of select="catESAD_cu:OriginCountryCode"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<!--td style="width:{2.2*$k}mm;border-right:solid 0.8pt black; border-bottom:solid 1.5pt black;">b</td-->
								<td style="border-right:solid 0.8pt black; border-bottom:solid 1.5pt black;word-break: break-all;">b</td>
								<!--td style="width:{6.6*$k}mm;border-right:solid 1.5pt black; border-bottom:solid 1.5pt black;"-->
								<td style="border-right:solid 1.5pt black; border-bottom:solid 1.5pt black;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<!--td align="left" style="width:{30.8*$k}mm; border-right:solid 0.8pt black; border-bottom:solid 0.8pt black"-->
								<td align="left" style="border-right:solid 0.8pt black; border-bottom:solid 0.8pt black;word-break: break-all;">
									<xsl:if test="catESAD_cu:GrossWeightQuantity">
										<xsl:value-of select="catESAD_cu:GrossWeightQuantity"/>
									</xsl:if>
									<xsl:if test="ESADout_CU:TotalGrossMassMeasure"> / <xsl:value-of select="ESADout_CU:TotalGrossMassMeasure/cat_ru:GoodsQuantity"/>
									</xsl:if>
								</td>
								<!--td align="left" style="width:{15.8*$k}mm; border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;"-->
								<td align="left" style="border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;word-break: break-all;">
									<xsl:choose>
										<xsl:when test="catESAD_cu:Preferencii">
											<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:CustomsTax"/>
											<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:CustomsDuty"/>
											<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:Excise"/>
											<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:Rate"/>
										</xsl:when>
										<xsl:otherwise>
											<br/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr class="graph" align="left" style="vertical-align: top">
								<!--td colspan="4" style="width:{20.6*$k}mm;border-left:solid 1.5pt black;border-right:solid 1.5pt black;"-->
								<td colspan="4" style="border-left:solid 1.5pt black;border-right:solid 1.5pt black;word-break: break-all;">
									<span class="graphNo">37</span>
									<span class="graph">Процедура</span>
								</td>
								<!--td style="width:{30.8*$k}mm; border-right:solid 0.8pt black;"-->
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">38</span>
									<span class="graph">Вес нетто (кг)</span>
								</td>
								<!--td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;"-->
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">39</span>
									<span class="graphTitleIt">Квота</span>
								</td>
							</tr>
							<tr class="graph" align="left" style="vertical-align: bottom">
								<!--td colspan="2" align="center" style="width:{11.8*$k}mm; border-left:solid 1.5pt black; border-right:solid 0.8pt black; border-bottom:solid 1.5pt black;"-->
								<td colspan="2" align="center" style="border-left:solid 1.5pt black; border-right:solid 0.8pt black; border-bottom:solid 1.5pt black;word-break: break-all;">
									<xsl:choose>
										<xsl:when test="ESADout_CU:ESADCustomsProcedure">
											<xsl:value-of select="ESADout_CU:ESADCustomsProcedure/catESAD_cu:MainCustomsModeCode"/>
											<xsl:value-of select="ESADout_CU:ESADCustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<!--td colspan="2" align="center" style="width:{8.8*$k}mm;border-right:solid 1.5pt black;border-bottom:solid 1.5pt black;"-->
								<td colspan="2" align="center" style="border-right:solid 1.5pt black;border-bottom:solid 1.5pt black;word-break: break-all;">
									<xsl:choose>
										<xsl:when test="ESADout_CU:ESADCustomsProcedure">
											<xsl:value-of select="ESADout_CU:ESADCustomsProcedure/catESAD_cu:GoodsTransferFeature"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<!--td style="width:{30.8*$k}mm; border-right:solid 0.8pt black;border-bottom:solid 0.8pt black"-->
								<td style="border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;word-break: break-all;">
									<xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
									<xsl:if test="catESAD_cu:NetWeightQuantity2">/<xsl:value-of select="catESAD_cu:NetWeightQuantity2"/>
									</xsl:if>
									<xsl:if test="ESADout_CU:TotalNetMassMeasure"> / <xsl:value-of select="ESADout_CU:TotalNetMassMeasure/cat_ru:GoodsQuantity"/>
									</xsl:if>
								</td>
								<!--td style="width:{15.8*$k}mm; border-right:solid 0.8pt black; border-bottom:solid 0.8pt black;"-->
								<td style="border-right:solid 0.8pt black; border-bottom:solid 0.8pt black;word-break: break-all;">
									<xsl:for-each select="ESADout_CU:ESADGoodsQuota">
										<xsl:if test="catESAD_cu:ESADCurrencyQuota">
											<xsl:for-each select="catESAD_cu:ESADCurrencyQuota">
												<xsl:value-of select="catESAD_cu:QuotaCurrencyQuantity"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="catESAD_cu:QuotaCurrencyName"/>
												(<xsl:value-of select="catESAD_cu:QuotaCurrencyCode"/>)
											</xsl:for-each>
										</xsl:if>
										<br/>
										<xsl:if test="catESAD_cu:ESADProductQuantityQuota">
											<xsl:for-each select="catESAD_cu:ESADProductQuantityQuota">
												<xsl:value-of select="catESAD_cu:QuotaQuantity"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="catESAD_cu:QuotaMeasurementName"/>
												(<xsl:value-of select="catESAD_cu:QuotaMeasureUnitQualifierCode"/>)
											</xsl:for-each>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="graph" style="vertical-align: bottom;">
					<td colspan="3" style="width:{67.2*$k}mm; border-right:solid 0.8pt black; border-bottom:solid 0.8pt black; background:#FFFFFF;word-break: break-all;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr class="graph" align="left" style="vertical-align: top">
								<td style="width:{67.2*$k}mm; border-left:solid 0.8pt black; border-top:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">40</span>
									<span class="graph">Общая декларация/Предшествующий документ</span>
								</td>
							</tr>
							<tr class="graph" align="left" style="vertical-align: bottom">
								<td style="width:{67.2*$k}mm; border-left:solid 0.8pt black;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:for-each select="ESADout_CU:ESADout_CUPrecedingDocument">
										<xsl:if test="catESAD_cu:PrecedingDocumentID">
											<xsl:value-of select="catESAD_cu:PrecedingDocumentID"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
										<xsl:if test="catESAD_cu:PrecedingDocumentName">
											<xsl:value-of select="catESAD_cu:PrecedingDocumentName"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
										<xsl:if test="catESAD_cu:PrecedingDocumentCustomsCode">
											<xsl:value-of select="catESAD_cu:PrecedingDocumentCustomsCode"/>
											<xsl:text> / </xsl:text>
										</xsl:if>
										<xsl:call-template name="russian_date_gtd">
											<xsl:with-param name="dateIn" select="catESAD_cu:PrecedingDocumentDate"/>
										</xsl:call-template>
										<xsl:text> / </xsl:text>
										<xsl:if test="catESAD_cu:AddNumberPart">
											<xsl:value-of select="catESAD_cu:AddNumberPart"/>
										</xsl:if>
										<xsl:value-of select="catESAD_cu:PrecedingDocumentNumber"/>
										<xsl:if test="catESAD_cu:PrecedingDocumentGoodsNumeric">
											<xsl:text> / </xsl:text>
											<xsl:value-of select="catESAD_cu:PrecedingDocumentGoodsNumeric"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:DTMDocDetails">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="catESAD_cu:DTMDocDetails"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:TIRIdDetails">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="catESAD_cu:TIRIdDetails"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:OtherPrDocumentNumber">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="catESAD_cu:OtherPrDocumentNumber"/>
											<xsl:if test="catESAD_cu:OtherPrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="catESAD_cu:OtherPrDocumentDate"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
										<xsl:if test="catESAD_cu:PIDocumentNumber">
											<xsl:text> / Рег.№ ПИ </xsl:text>
											<xsl:apply-templates select="catESAD_cu:PIDocumentNumber"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:CustomsCost">
											<xsl:text> / </xsl:text>
											<xsl:value-of select="format-number(catESAD_cu:CustomsCost,'0.00')"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:NetWeight">
											<xsl:text> / </xsl:text>
											<xsl:value-of select="catESAD_cu:NetWeight"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:NetWeightQuantity">
											<xsl:text> / </xsl:text>
											<xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
										</xsl:if>
										<xsl:if test="(catESAD_cu:NetWeightQuantity) or (catESAD_cu:SupplementaryGoodsQuantity)">
											<xsl:text> / </xsl:text>
											<xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
											<xsl:for-each select="catESAD_cu:SupplementaryGoodsQuantity">
												<xsl:text>, </xsl:text>
												<xsl:value-of select="cat_ru:GoodsQuantity"/>
												<xsl:if test="cat_ru:MeasureUnitQualifierCode">
													(<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<br/>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr valign="top">
					<td class="graph" style="width:{13*$k}mm;border-right:solid 0.8pt black;border-top:solid 0.4pt black;border-bottom:solid 0.8pt black;word-break: break-all;" valign="top">
						<span class="graphNo">44</span>
						<span class="graphColumn">Дополнит. информация/ Представл. документы</span>
					</td>
					<td class="graph" colspan="2" style="width:{122.8*$k}mm;border-bottom:solid 0.8pt black; background:#FFFFFF;word-break: break-all;">
						<xsl:if test="ESADout_CU:ESADout_CUPresentedDocument">
							<xsl:for-each select="ESADout_CU:ESADout_CUPresentedDocument">
								<xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>
								<xsl:if test="RUDECLcat:DocumentPresentingDetails/RUDECLcat:DocPresentKindCode">
									<xsl:text>/</xsl:text>
									<xsl:value-of select="RUDECLcat:DocumentPresentingDetails/RUDECLcat:DocPresentKindCode"/>
								</xsl:if>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:choose>
									<xsl:when test="contains(cat_ru:PrDocumentNumber,'ОБЯЗУЮСЬ ПРЕДОСТАВИТЬ ДО')">
										<xsl:value-of select="cat_ru:PrDocumentNumber"/>
										<xsl:text> </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="RUDECLcat:DocumentPresentingDetails/RUDECLcat:DocPresentDate"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="cat_ru:PrDocumentNumber"/>
										<xsl:if test="RUDECLcat:DocumentPresentingDetails/RUDECLcat:DocPresentDate and RUDECLcat:DocumentPresentingDetails/RUDECLcat:DocPresentKindCode='3'">
											<xsl:text> ОБЯЗУЮСЬ ПРЕДОСТАВИТЬ ДО </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="RUDECLcat:DocumentPresentingDetails/RUDECLcat:DocPresentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="catESAD_cu:LicenseGoods">/<xsl:if test="catESAD_cu:LicenseGoods/catESAD_cu:AppNumber">
										<xsl:value-of select="catESAD_cu:LicenseGoods/catESAD_cu:AppNumber"/>/</xsl:if>
									<xsl:value-of select="catESAD_cu:LicenseGoods/catESAD_cu:GoodsNumericLic"/>
								</xsl:if>
								<xsl:if test="cat_ru:PrDocumentDate">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</xsl:if>
								<!--xsl:if test="cat_ru:PrDocumentName">
								   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								   <xsl:value-of select="cat_ru:PrDocumentName"/>
								</xsl:if-->
								<xsl:if test="catESAD_cu:DocumentBeginActionsDate">
									<xsl:text> с </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="catESAD_cu:DocumentEndActionsDate">
									<xsl:text> по </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test=" (RUDECLcat:DocumentPresentingDetails/RUDECLcat:CustomsDocIdDetails or RUDECLcat:DocumentPresentingDetails/RUDECLcat:DTMDocDetails or RUDECLcat:DocumentPresentingDetails/RUDECLcat:TIRIdDetails or RUDECLcat:DocumentPresentingDetails/RUDECLcat:OtherPrecedingDocId) and RUDECLcat:DocumentPresentingDetails/RUDECLcat:DocPresentKindCode='2'">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:choose>
										<xsl:when test="RUDECLcat:DocumentPresentingDetails/RUDECLcat:CustomsDocIdDetails">
											<xsl:apply-templates select="RUDECLcat:DocumentPresentingDetails/RUDECLcat:CustomsDocIdDetails"/>
										</xsl:when>
										<xsl:when test="RUDECLcat:DocumentPresentingDetails/RUDECLcat:DTMDocDetails">
											<xsl:apply-templates select="RUDECLcat:DocumentPresentingDetails/RUDECLcat:DTMDocDetails"/>
										</xsl:when>
										<xsl:when test="RUDECLcat:DocumentPresentingDetails/RUDECLcat:TIRIdDetails">
											<xsl:apply-templates select="RUDECLcat:DocumentPresentingDetails/RUDECLcat:TIRIdDetails"/>
										</xsl:when>
										<xsl:when test="RUDECLcat:DocumentPresentingDetails/RUDECLcat:OtherPrecedingDocId">
											<xsl:text>№ </xsl:text>
											<xsl:value-of select="RUDECLcat:DocumentPresentingDetails/RUDECLcat:OtherPrecedingDocId"/>
											<xsl:if test="RUDECLcat:DocumentPresentingDetails/RUDECLcat:OtherPrecedingDocDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="RUDECLcat:DocumentPresentingDetails/RUDECLcat:OtherPrecedingDocDate"/>
												</xsl:call-template>
												<xsl:value-of select="RUDECLcat:DocumentPresentingDetails/RUDECLcat:OtherPrecedingDocDate"/>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="catESAD_cu:CountryCode">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="catESAD_cu:CountryCode"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:CustomsPaymentModeCodeType">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="catESAD_cu:CustomsPaymentModeCodeType"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:TemporaryStorageImportDate">
									<!--<xsl:text> Срок временного ввоза </xsl:text>-->
									<xsl:text> </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="catESAD_cu:TemporaryStorageImportDate"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="catESAD_cu:TemporaryImportCode">
									<xsl:text> /</xsl:text>
									<!--<xsl:value-of select="catESAD_cu:TemporaryStorageImportDate"/>-->
									<xsl:value-of select="catESAD_cu:TemporaryImportCode"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:SupplyStatus">
									<xsl:text> /Опережающая поставка </xsl:text>
								</xsl:if>
								<xsl:if test="catESAD_cu:SpecialSimplifiedCode">
									<xsl:text> /</xsl:text>
									<xsl:for-each select="catESAD_cu:SpecialSimplifiedCode">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>; </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ancestor::node()/ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingDoc/cat_ru:PrDocumentDate"/>
								</xsl:call-template>
								<br/>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions">
							<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Organization">
								<xsl:value-of select="cat_ru:OrganizationName"/>
								<xsl:text> </xsl:text>
							</xsl:for-each>
							<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingPlaceDetails">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">; </xsl:if>
							</xsl:for-each>
							<xsl:text> </xsl:text>
						</xsl:if>
					</td>
					<td class="graph" colspan="3" style="border-bottom:solid 0.8pt black; border-right:solid 0.8pt black;word-break: break-all;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<td class="graph" style="width:{27.2*$k}mm; vertical-align: top; border:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">41</span>
									<span class="graph">Дополнит.единицы</span>
									<br/>
									<xsl:for-each select="ESADout_CU:SupplementaryGoodsQuantity">
										<xsl:value-of select="cat_ru:GoodsQuantity"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierName">
										<xsl:text disable-output-escaping="yes">/</xsl:text>
										<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
										</xsl:if>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
										<xsl:text disable-output-escaping="yes">/</xsl:text>
										<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td class="graph" style="width:{28*$k}mm; vertical-align: top; border-top:solid 0.8pt black; border-bottom:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">42</span>
									<span class="graph">Цена товара</span>
									<br/>
									<xsl:if test="catESAD_cu:InvoicedCost">
										<xsl:value-of select="format-number(catESAD_cu:InvoicedCost,'0.00')"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:InvoicedCurrencyCode">/<xsl:value-of select="catESAD_cu:InvoicedCurrencyCode"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:InvoicedCurrencyRate">/<xsl:value-of select="format-number(catESAD_cu:InvoicedCurrencyRate,'0.00')"/>
									</xsl:if>
								</td>
								<td style="vertical-align: bottom; border:solid 0.8pt black; border-left:solid 1.5pt black;word-break: break-all;">
									<table cellpadding="0" cellspacing="0" style="width:100%;">
										<tr>
											<td align="left" class="graph" colspan="2" style="width:{15.8*$k}mm;word-break: break-all;">
												<span class="graphNo">43</span>
												<span class="graph">Код МОС</span>
											</td>
										</tr>
										<tr>
											<td align="center" class="graph" style="width:{8.8*$k}mm; border-bottom:solid 1.5pt black; border-right:solid 1.5pt black;word-break: break-all;">
												<xsl:choose>
													<xsl:when test="catESAD_cu:CustomsCostCorrectMethod">
														<xsl:value-of select="catESAD_cu:CustomsCostCorrectMethod"/>
													</xsl:when>
													<xsl:otherwise>
														<br/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td align="left" class="graph" style="width:{7*$k}mm;word-break: break-all;">
												<br/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" style="width:100%">
							<tr class="graph">
								<td rowspan="2" style="width:{27.2*$k}mm;background:#FFFFFF;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:{10*$k}mm;border-right:solid 1.5pt black;background:#FFFFFF;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td rowspan="2" style="width:{30*$k}mm; border-top:solid 0.8pt black;word-break: break-all;" valign="top">
									<span class="graphNo">45</span>
									<span class="graph">Таможенная стоимость</span>
									<br/>
									<xsl:if test="catESAD_cu:CustomsCost">
										<xsl:value-of select="format-number(catESAD_cu:CustomsCost,'0.00')"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:{10*$k}mm;border-right:solid 1.5pt black;border-bottom:solid 1.5pt black;border-left:solid 1.5pt black;background:#FFFFFF;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<td class="graph" style="width:{27.2*$k}mm; border-bottom:solid 0.4pt silver; border-top:solid 0.4pt silver; border-left:solid 0.4pt silver; background:#FFFFFF;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td class="graph" style="width:{40*$k}mm; border:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">46</span>
									<span class="graph">Статистическая стоимость</span>
									<br/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="catESAD_cu:StatisticalCost">
										<xsl:value-of select="format-number(catESAD_cu:StatisticalCost,'0.00')"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:TotalStatisticValueAmount"> / <xsl:value-of select="format-number(catESAD_cu:TotalStatisticValueAmount,'0.00')"/>
									</xsl:if>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUDECLcat:CustomDocIDType -->
	<xsl:template match="RUDECLcat:CustomsDocIdDetails">
		<xsl:text>ДТ: </xsl:text>
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:if test="RUDECLcat:Code">
			<xsl:text>, </xsl:text>
			<span class="normal">, № изм. и(или) доп.: </span>
			<xsl:value-of select="RUDECLcat:Code"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUDECLcat:PlaceDetailsType -->
	<xsl:template match="RUDECLcat:ProcessingPlaceDetails">
		<xsl:value-of select="RUDECLcat:PlaceName"/>
		<xsl:if test="RUDECLcat:PlaceName and RUDECLcat:AddressDetails">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates mode="ru_address" select="RUDECLcat:AddressDetails"/>
	</xsl:template>
	<!-- Шаблон для типа RUDECLcat:DTMDocDetailsType -->
	<xsl:template match="RUDECLcat:DTMDocDetails|catESAD_cu:DTMDocDetails">
		<xsl:text>ТДТС: </xsl:text>
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:for-each select="*">
			<xsl:if test="local-name()='TransportModeCode'">
				<xsl:text>, код вида ТС: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUDECLcat:TIRIdDetailsType -->
	<xsl:template match="RUDECLcat:TIRIdDetails|catESAD_cu:TIRIdDetails">
		<xsl:for-each select="*">
			<xsl:if test="local-name()='TIRSeries'">
				<xsl:text>МДП: серия </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='TIRID'">
				<xsl:text> № </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">(<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType -->
	<xsl:template match="catESAD_cu:Dimensions|catESAD_cu:AllowanceDetails|catESAD_cu:DeviationDetails">
		<xsl:value-of select="catESAD_cu:LengthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:value-of select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:value-of select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)<xsl:if test="catESAD_cu:WidthMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:value-of select="catESAD_cu:WidthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:value-of select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:value-of select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
		<xsl:if test="catESAD_cu:HeightMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure or catESAD_cu:WidthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:value-of select="catESAD_cu:HeightMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:value-of select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:value-of select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:IdentityCard|RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--Платежи по товару-->
	<xsl:template match="ESADout_CU:ESADout_CUGoods" mode="payments">
		<table class="addInfo" style="width: 100%;">
			<tr>
				<td class="graph">Вид</td>
				<td class="graph">Основа начисления</td>
				<td class="graph">Ставка</td>
				<td class="graph">Сумма</td>
				<td class="graph">СП</td>
			</tr>
			<xsl:apply-templates select="ESADout_CU:ESADout_CUCustomsPaymentCalculation"/>
			<tr>
				<td class="graph" colspan="2"/>
				<td class="graph">Всего:</td>
				<td class="graph">
					<xsl:variable name="Sum47G" select="sum(ESADout_CU:ESADout_CUCustomsPaymentCalculation[catESAD_cu:PaymentCode!='УН' and catESAD_cu:PaymentCode!='УР']/catESAD_cu:PaymentAmount)"/>
					<xsl:value-of select="format-number($Sum47G,'#.##')"/>
				</td>
				<td/>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="ESADout_CU:ESADout_CUCustomsPaymentCalculation">
		<tr>
			<td class="graph">
				<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
			</td>
			<td class="graph">
				<xsl:if test="catESAD_cu:TaxBase">
					<xsl:value-of select="catESAD_cu:TaxBase"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:value-of select="catESAD_cu:NumberGroup"/>
			</td>
			<td class="graph">
				<xsl:value-of select="catESAD_cu:Rate"/>
				<xsl:if test="catESAD_cu:PaymentModeCode != 10">
					<xsl:text> </xsl:text>
					<xsl:choose>
						<xsl:when test="catESAD_cu:RateTypeCode = '*'">
							<xsl:value-of select="catESAD_cu:RateTNVEDQualifierCode"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="catESAD_cu:Rate">%</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="catESAD_cu:NumberDays">
					<xsl:text>x</xsl:text>
					<xsl:value-of select="catESAD_cu:NumberDays"/>
				</xsl:if>
			</td>
			<td class="graph">
				<xsl:if test="catESAD_cu:PaymentAmount">
					<xsl:value-of select="format-number(catESAD_cu:PaymentAmount,'0.00')"/>
				</xsl:if>
			</td>
			<td class="graph">
				<xsl:value-of select="catESAD_cu:PaymentCode"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="."/>
		</xsl:call-template>
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
	<xsl:template match="catESAD_cu:RFOrganizationFeatures">
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
			<span>КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catESAD_cu:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>Идентификационный номер: 
         <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catESAD_cu:RKOrganizationFeatures">
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
         <xsl:value-of select="cat_ru:CategoryCode"/>/
         <xsl:value-of select="cat_ru:KATOCode"/>/
         <xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">
            /<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>