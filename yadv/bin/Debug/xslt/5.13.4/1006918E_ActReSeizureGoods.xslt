<?xml version="1.0" encoding="utf-8"?>
<!-- 
Приказ ФТС России "Об утверждении форм документов, применяемых при проведении таможенных проверок, порядков их заполнения и 
порядка внесения изменений (дополнений) в решение о проведении выездной таможенной проверки"
Приложение 15 Акт о возврате изъятых товаров
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.13.3" xmlns:arsg="urn:customs.ru:Information:CustomsAuditDocuments:ActReSeizureGoods:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3">
	<!-- Шаблон для типа ActReSeizureGoodsType -->
	<xsl:template match="arsg:ActReSeizureGoods">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
					max-width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
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
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
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
										МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>(МИНФИН РОССИИ)<br/>
										<br/>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА<br/>
									</font>
								</td>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:value-of select="arsg:CustomActArresting/cat_ru:OfficeName"/>
									<xsl:if test="arsg:CustomActArresting/cat_ru:OfficeName and arsg:CustomActArresting/cat_ru:Code">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="arsg:CustomActArresting/cat_ru:Code"/>
									<xsl:if test="arsg:CustomActArresting/cat_ru:OfficeName and arsg:CustomActArresting/cat_ru:Code">
										<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="descr">(наименование таможенного органа)</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>АКТ</b>
									<br/>о возврате изъятых товаров
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<table>
										<tbody>
											<tr valign="bottom" align="center">
												<td width="20%" class="value">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="arsg:ActDate"/>
													</xsl:call-template>
												</td>
												<td/>
												<td width="20%" class="value">
													<xsl:value-of select="arsg:ActPlace"/>
												</td>
											</tr>
											<tr>
												<td class="descr">(дата)</td>
												<td/>
												<td class="descr">(место составления)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Мы, нижеподписавшиеся:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="arsg:CustomActArresting/adt_cat:ApproverPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии) должностного лица таможенного органа)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="arsg:PersonStorGoods/adt_cat:ResponsiblePerson"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="identity" select="arsg:PersonStorGoods/RUScat_ru:IdentityCard"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="document" select="arsg:PersonStorGoods/adt_cat:AuthoritesDocument"/>
											<xsl:text> (далее – представитель хранителя товаров)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность лица, осуществлявшего хранение изъятых товаров, либо его представителя)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="arsg:PersonOwnGoods/adt_cat:ResponsiblePerson"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="identity" select="arsg:PersonOwnGoods/RUScat_ru:IdentityCard"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="document" select="arsg:PersonOwnGoods/adt_cat:AuthoritesDocument"/>
											<xsl:text> (далее – представитель владельца товаров)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность лица, которому возвращаются изъятые товары, либо его представителя) '"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>составили настоящий акт о том, что на основании постановления о возврате изъятых товаров</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="arsg:ResolutionInfo/adt_cat:CustomsIssued/adt_cat:ApproverPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии) лица, вынесшего постановление о возврате изъятых товаров)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text> от </xsl:text>
									<u>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="arsg:ResolutionInfo/adt_cat:Date"/>
										</xsl:call-template>
									</u>
									<xsl:text> г.</xsl:text>
									<br/>
									<xsl:text>представитель хранителя товаров передал, а представитель владельца товаров принял находившиеся на хранении </xsl:text>
									<u>
										<xsl:apply-templates mode="organization" select="arsg:PersonStorGoods"/>
									</u>
									<xsl:text> товары </xsl:text>
									<u>
										<xsl:for-each select="arsg:GoodsInfo/arsg:Goods">
											<xsl:value-of select="position()"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="arsg:GoodsDescription"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="quantity" select="arsg:GoodsQuantity"/>
											<xsl:if test="arsg:GoodsCharacteristics">
												<xsl:text>; характеристики: </xsl:text>
												<xsl:apply-templates select="arsg:GoodsCharacteristics"/>
											</xsl:if>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
										<xsl:if test="arsg:GoodsInfo/arsg:InventoryGoodsSign='true' or arsg:GoodsInfo/arsg:InventoryGoodsSign=1">
											<xsl:text> опись товаров прилагается </xsl:text>
											<xsl:if test="arsg:GoodsInfo/arsg:SheetNumber">
												<xsl:text> на </xsl:text>
												<xsl:value-of select="arsg:GoodsInfo/arsg:SheetNumber"/>
												<xsl:text> л.</xsl:text>
											</xsl:if>
										</xsl:if>
									</u>
									<xsl:text> изъятые по акту от </xsl:text>
									<u>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="arsg:ActSeizure"/>
										</xsl:call-template>
									</u>
									<xsl:text>, копия акта изъятия товаров на </xsl:text>
									<u>
										<xsl:value-of select="arsg:CopyActSeizureSheetNumber"/>
									</u>
									<xsl:text> листах прилагается.</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Средства идентификации </xsl:text>
									<u>
										<xsl:choose>
											<xsl:when test="arsg:SealSign=1 or arsg:SealSign='true'">повреждены</xsl:when>
											<xsl:otherwise>не повреждены</xsl:otherwise>
										</xsl:choose>
									</u>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Замечания: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="arsg:PersonsNotesInfo"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(содержание замечаний лиц, участвовавших в передаче товаров)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Представитель хранителя товаров:</xsl:text>
									<xsl:call-template name="signature">
										<xsl:with-param name="data" select="arsg:PersonStorGoods/adt_cat:ResponsiblePerson"/>
										<xsl:with-param name="descr" select="'(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) лица, осуществлявшего хранение изъятых товаров, его представителя)'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Представитель владельца товаров:</xsl:text>
									<xsl:call-template name="signature">
										<xsl:with-param name="data" select="arsg:PersonOwnGoods/adt_cat:ResponsiblePerson"/>
										<xsl:with-param name="descr" select="'(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) лица, которому возвращаются изъятые товары, его представителя)'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Должностное лицо таможенного органа:</xsl:text>
									<xsl:call-template name="signature">
										<xsl:with-param name="data" select="arsg:CustomActArresting/adt_cat:ApproverPerson"/>
										<xsl:with-param name="descr" select="'(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Второй экземпляр настоящего акта получил:</xsl:text>
									<xsl:call-template name="signature">
										<xsl:with-param name="data" select="arsg:SecondExempReceived"/>
										<xsl:with-param name="descr" select="'(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) лица, получившего второй экземпляр акта)'"/>
									</xsl:call-template>
									<u>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="arsg:SecondExempReceived/adt_cat:Date"/>
										</xsl:call-template>
									</u>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Третий экземпляр настоящего акта получил:</xsl:text>
									<xsl:call-template name="signature">
										<xsl:with-param name="data" select="arsg:ThirdExempReceived"/>
										<xsl:with-param name="descr" select="'(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) лица, получившего третий экземпляр акта)'"/>
									</xsl:call-template>
									<u>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="arsg:ThirdExempReceived/adt_cat:Date"/>
										</xsl:call-template>
									</u>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="signature">
		<xsl:param name="data"/>
		<xsl:param name="descr"/>
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="70%" class="value">
						<xsl:apply-templates mode="person" select="$data"/>
					</td>
					<td/>
					<td width="25%" class="value"></td>
				</tr>
				<tr valign="top">
					<td class="descr"><xsl:value-of select="$descr"/></td>
					<td/>
					<td class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="arsg:DocsDescription"/>
		<xsl:text> </xsl:text>
		<xsl:if test="arsg:DocsQuantity">
			<xsl:text>, кол-во: </xsl:text>
			<xsl:value-of select="arsg:DocsQuantity"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="person_nopost" match="*">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:PersonId"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="adt_cat:FactAddress">
			<xsl:text> факт. адрес: </xsl:text>
			<xsl:apply-templates select="adt_cat:FactAddress" mode="address"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template> 
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
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
