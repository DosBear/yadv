<?xml version="1.0" encoding="utf-8"?>
<!-- 
Приказ ФТС России "Об утверждении форм документов, применяемых при проведении таможенных проверок, порядков их заполнения и 
порядка внесения изменений (дополнений) в решение о проведении выездной таможенной проверки"
Приложение 4 Акт об отказе в доступе на объект проверяемого лица для проведения выездной  таможенной проверки
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.13.3" xmlns:adaa="urn:customs.ru:Information:CustomsAuditDocuments:ActDenialAccessAudit:5.13.3">
	<!-- Шаблон для типа ActDenialAccessAuditType -->
	<xsl:template match="adaa:ActDenialAccessAudit">
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
									<xsl:value-of select="adaa:Customs/cat_ru:OfficeName"/>
									<xsl:if test="adaa:Customs/cat_ru:OfficeName  and adaa:Customs/cat_ru:Code">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="adaa:Customs/cat_ru:Code"/>
									<xsl:if test="adaa:Customs/cat_ru:OfficeName  and adaa:Customs/cat_ru:Code">
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
									<br/>об отказе в доступе на объект проверяемого лица для проведения выездной<br/>таможенной проверки
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="bottom" align="center">
												<td width="20%" class="value">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="adaa:ActDate"/>
													</xsl:call-template>
												</td>
												<td/>
												<td width="20%" class="value">
													<xsl:value-of select="adaa:ActPlace"/>
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
									<br/>
									<xsl:choose>
										<xsl:when test="count(adaa:CustomsPersonInfo) &gt; 1">Должностным лицом (должностными лицами)</xsl:when>
										<xsl:otherwise>Должностным лицом</xsl:otherwise>
									</xsl:choose>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="adaa:CustomsPersonInfo">
												<xsl:apply-templates mode="person" select="adaa:ApproverPerson"/>
												<xsl:if test="position()!=last()">; </xsl:if>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description">(должность, фамилия, имя, отчество (отчество указывается при наличии) должностного лица таможенного органа, составившего акт)</xsl:with-param>
										<xsl:with-param name="width">100%</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>в присутствии понятых:</td>
							</tr>
							<tr>
								<td>
									<xsl:for-each select="adaa:Witnesses">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="position()"/>
												<xsl:text>. </xsl:text>
												<xsl:apply-templates mode="person" select="."/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="identity" select="./adt_cat:Passport"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="address" select="./adt_cat:ResidencePlace"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность, место жительства)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>на основании пункта 4 статьи 334 Таможенного кодекса Евразийского экономического союза составлен настоящий акт о том, что при проведении выездной таможенной проверки</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="organization" select="adaa:AuditOrganization"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(сведения о проверяемом лице: наименование, ОГРН, ИНН, КПП юридического лица/фамилия, имя, отчество (отчество указывается при наличии), ОГРНИП, ИНН индивидуального предпринимателя; место нахождения, место фактического осуществления деятельности)'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>на основании решения о проведении выездной таможенной проверки от </xsl:text>
									<u>&#160;<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="adaa:DecisionPerformAudit/adt_cat:Date"/></xsl:call-template>&#160;</u>
									<xsl:text> № </xsl:text>
									<u>&#160;<xsl:value-of select="adaa:DecisionPerformAudit/adt_cat:Number"/>&#160;</u>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>отказано в доступе в (на) </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="adaa:DeniedAccessRooms"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(наименование помещения и (или) территории, иные сведения, идентифицирующие помещение и (или) территорию)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>расположенное(ые) по адресу:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="address" select="adaa:RoomsAddress"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(адрес территории или помещения)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>Следующим должностным лицам:</td>
							</tr>
							<tr>
								<td>
									<xsl:text>таможенного органа, проводящим выездную таможенную проверку</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="adaa:CustomsPersonInfo">
								<tr>
									<td class="value">
										<xsl:value-of select="position()"/>
										<xsl:text>. </xsl:text>
										<xsl:apply-templates mode="person" select="./adaa:ApproverPerson"/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td>
									<xsl:text>иных государственных органов, привлеченным для участия в проведении выездной таможенной проверки</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="adaa:ListAttractedPersons">
								<tr>
									<td class="value">
										<xsl:value-of select="position()"/>
										<xsl:text>. </xsl:text>
										<xsl:apply-templates mode="person" select="."/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td>
									<br/><br/>
									<xsl:text>Должностным(и) лицом(ами) таможенного органа совершены следующие действия:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="adaa:SuppresAndUnsealInfo"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(указываются сведения о фактах пресечения сопротивления, вскрытия запертых помещений и др.)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Замечания, заявления, сделанные присутствующими лицами: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="adaa:PersonsNotesInfo"/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<br/><br/>
									<xsl:text>Должностное(ые) лицо(а) таможенного органа:</xsl:text>
									<xsl:for-each select="adaa:CustomsPersonInfo">
										<xsl:apply-templates mode="signature" select="./adaa:ApproverPerson"/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<br/><br/>
									<xsl:text>Понятые:</xsl:text>
									<xsl:for-each select="adaa:Witnesses">
										<xsl:apply-templates mode="signature" select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<br/><br/>
									<xsl:text>Проверяемое лицо (представитель):</xsl:text>
									<xsl:apply-templates mode="signature" select="adaa:AuditOrganizationSignature"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/><br/>
									Должностные лица, привлеченные для участия<br/>в проведении проверки:
									<xsl:for-each select="adaa:ListAttractedPersons">
										<xsl:apply-templates mode="signature" select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<br/><br/>
									<xsl:text>Отметки должностных лиц таможенного органа:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="adaa:RefusalMark/adt_cat:RefusalMark"/>
										</xsl:with-param>
										<xsl:with-param name="description" select="'(запись об отказе от подписания акта)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:apply-templates mode="signature" select="adaa:RefusalMark"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/><br/>
									<xsl:text>Копию акта получил:</xsl:text>
									<xsl:apply-templates mode="signature2ndCopy" select="adaa:SecondExempReceived"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:call-template name="russian_date_month">
												<xsl:with-param name="dateIn" select="adaa:SecondExempReceived/adt_cat:Date"/>
											</xsl:call-template>
										</xsl:with-param>
										<xsl:with-param name="description" select="'(дата получения второго экземпляра акта)'"/>
										<xsl:with-param name="width" select="'40%'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="signature2ndCopy" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="70%" class="value">
						<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName|cat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
						</xsl:for-each>
					</td>
					<td></td>
					<td width="20%" class="value"></td>
				</tr>
				<tr>
					<td class="descr">(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) лица (представителя), получившего второй экземпляр акта)</td>
					<td></td>
					<td class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="signature" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="50%" class="value">
						<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName|cat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
						</xsl:for-each>
					</td>
					<td></td>
					<td width="30%" class="value"></td>
				</tr>
				<tr>
					<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества<br/>указывается при наличии отчества)</td>
					<td></td>
					<td class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="person_nopost" match="*">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
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
