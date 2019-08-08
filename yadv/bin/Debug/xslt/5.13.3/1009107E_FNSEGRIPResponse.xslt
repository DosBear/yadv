<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:feip_req="urn:customs.ru:Information:SQDocuments:FNSEGRIPResponse:5.13.3">
	<!-- Шаблон для типа FNSEGRIPResponseType -->
	<xsl:template match="feip_req:FNSEGRIPResponse">
		<html>
			<head>
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
					padding: 10mm 5mm 10mm 5mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}
	
					.marg-t1
					{
					margin-top:10mm;
					font-size: 14pt;
					}
	
					.marg-top
					{
					margin-top:3mm;
					font-size: 12pt;
					}
	
					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 0px;
					}
	
					table.border tr td
					{
					border: 1px solid gray;
					}
	
					.graph {
					font-family: Arial;
					font-size: 10pt;
					}
	
					.annot
					{
					border: solid 1px lightgray;
					}
	
					.value
					{
					border: solid 1px lightgray;
					}
	
					div.title, tr.title td { font-weight:bold; text-align: center  }
					div.title {width: 100%;}
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
										ЕДИНЫЙ ГОСУДАРСТВЕННЫЙ РЕЕСТР ИНДИВИДУАЛЬНЫХ ПРЕДПРИНИМАТЕЛЕЙ
									</font>
									<br/>
									<br/>
									<font size="4">
										Сведения об индивидуальном предпринимателе
									</font>
									<br/>
									<br/>
									<xsl:for-each select="feip_req:SvIP_SvFL_FIORus">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>ОГРНИП <xsl:value-of select="feip_req:SvIP_OGRNIP"/></td>
							</tr>
							<tr>
								<td>ИНН <xsl:value-of select="feip_req:SvIP_INNFL"/></td>
							</tr>
							<tr>
								<td>по состоянию на
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="feip_req:SvIP_DataVyp"/>
								</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190 data">
						<tbody>
							<tr align="center">
								<!--td width="5%">№<br/>п/п</td-->
								<td class="annot" width="50%" height="50px">Наименование показателя</td>
								<td class="annot">Значение показателя</td>
							</tr>
							<!--tr>
								<td colspan="3" align="center">
									Сведения об организационно-правовой форме и наименовании юридического лица
								</td>
							</tr>
							<tr>
								<td></td>
								<td>Организационно-правовая форма</td>
								<td><xsl:value-of select="feul_req:SvJuL_NaimOPF"/></td>
							</tr-->
						</tbody>
					</table>
					<table class="w190">
						<xsl:if test="feip_req:SvIP_DataVyp">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата формирования сведений из ЕГРИП в отношении индивидуального предпринимателя</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="feip_req:SvIP_DataVyp"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_OGRNIP">
							<tr>
								<td class="annot graphMain" style="width:50%">ОГРНИП</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="feip_req:SvIP_OGRNIP"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_INNFL">
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН физического лица</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="feip_req:SvIP_INNFL"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_KodVidIP">
							<tr>
								<td class="annot graphMain" style="width:50%">Код вида предпринимательства</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="feip_req:SvIP_KodVidIP=1">индивидуальный предприниматель</xsl:when>
										<xsl:when test="feip_req:SvIP_KodVidIP=2">глава крестьянского (фермерского хозяйства)</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="translate(feip_req:SvIP_KodVidIP, '.', ',')"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_DataOGRNIP">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата присвоения ОГРНИП</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="feip_req:SvIP_DataOGRNIP"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_NaimVidIP">
							<tr>
								<td class="annot graphMain" style="width:50%">Наименование вида предпринимательской деятельности</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="feip_req:SvIP_NaimVidIP"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_SvFL_Pol">
							<tr>
								<td class="annot graphMain" style="width:50%">Пол</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="feip_req:SvIP_SvFL_Pol=1">
											<xsl:text>мужской</xsl:text>
										</xsl:when>
										<xsl:when test="feip_req:SvIP_SvFL_Pol=2">
											<xsl:text>женский</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="feip_req:SvIP_SvFL_Pol"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_SvFL_FIORus">
							<xsl:apply-templates select="feip_req:SvIP_SvFL_FIORus"/>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_SvFL_FIOLat">
							<xsl:apply-templates select="feip_req:SvIP_SvFL_FIOLat"/>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_SvFL_GrnipData">
							<tr>
								<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="feip_req:SvIP_SvFL_GrnipData"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="feip_req:SvIP_SvFL_GrnipDataIspr">
							<tr>
								<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="feip_req:SvIP_SvFL_GrnipDataIspr"/>
								</td>
							</tr>
						</xsl:if>
					</table>
					<xsl:if test="feip_req:SvIP_SvRozhd">
						<div class="title marg-top">Сведения о рождении</div>
						<xsl:apply-templates select="feip_req:SvIP_SvRozhd"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvGrazhd">
						<div class="title marg-top">Сведения о гражданстве</div>
						<xsl:apply-templates select="feip_req:SvIP_SvGrazhd"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvUdLichnFL">
						<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
						<xsl:apply-templates select="feip_req:SvIP_SvUdLichnFL"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvPravZhitRF">
						<div class="title marg-top">Сведения о документе, подтверждающем право иностранного гражданина или лица без гражданства временно или постоянно проживать на территории Российской Федерации</div>
						<xsl:apply-templates select="feip_req:SvIP_SvPravZhitRF"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvAdrMZh_AdresRF">
						<div class="title marg-top">Сведения об адресе (месте жительства) индивидуального предпринимателя или главы КФХ</div>
						<xsl:apply-templates select="feip_req:SvIP_SvAdrMZh_AdresRF"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvAdrElPochta">
						<div class="title marg-top">Сведения об адресе электронной почты индивидуального предпринимателя или крестьянского (фермерского) хозяйства</div>
						<xsl:apply-templates select="feip_req:SvIP_SvAdrElPochta"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvRegIP">
						<div class="title marg-top">Сведения о регистрации индивидуального предпринимателя или крестьянского (фермерского) хозяйства</div>
						<xsl:apply-templates select="feip_req:SvIP_SvRegIP"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvRegOrg">
						<div class="title marg-top">Сведения о регистрирующем органе по месту жительства ИП или главы КФХ</div>
						<xsl:apply-templates select="feip_req:SvIP_SvRegOrg"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvStatus">
						<div class="title marg-top">Сведения о состоянии (статусе) ИП или КФХ</div>
						<xsl:apply-templates select="feip_req:SvIP_SvStatus"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvPrekrasch">
						<div class="title marg-top">Сведения о прекращении деятельности в качестве ИП или о прекращении КФХ</div>
						<xsl:apply-templates select="feip_req:SvIP_SvPrekrasch"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvUchetNO">
						<div class="title marg-top">Сведения об учете в налоговом органе</div>
						<xsl:apply-templates select="feip_req:SvIP_SvUchetNO"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvRegPF">
						<div class="title marg-top">Регистрационный номер в территориальном органе Пенсионного фонда Российской Федерации</div>
						<xsl:apply-templates select="feip_req:SvIP_SvRegPF"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvRegFSS">
						<div class="title marg-top">Сведения о регистрации в качестве страхователя в исполнительном органе Фонда социального страхования Российской Федерации</div>
						<xsl:apply-templates select="feip_req:SvIP_SvRegFSS"/>
					</xsl:if>
					<xsl:if test="feip_req:SvIP_SvOKVED">
						<div class="title marg-top">Сведения о видах экономической деятельности по Общероссийскому классификатору видов экономической деятельности</div>
						<xsl:apply-templates select="feip_req:SvIP_SvOKVED"/>
					</xsl:if>
					<!--xsl:if test="feip_req:SvIP_SvLicenzija">
						<div class="title marg-top">Сведения о лицензиях, выданных индивидуальному предпринимателю</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Серия и номер</td>
									<td class="graphMain bordered">Вид</td>
									<td class="graphMain bordered">Дата</td>
									<td class="graphMain bordered">Дата начала действия</td>
									<td class="graphMain bordered">Дата окончания действия</td>
									<td class="graphMain bordered">Наименование лицензируемого вида деятельности</td>
									<td class="graphMain bordered">Сведения об адресе места осуществления лицензируемого вида деятельности</td>
									<td class="graphMain bordered">Наименование лицензирующего органа, выдавшего или переоформившего лицензию</td>
									<td class="graphMain bordered">Дата приостановления действия лицензии</td>
									<td class="graphMain bordered">Наименование лицензирующего органа, приостановившего действие лицензии</td>
									<td class="graphMain bordered">ГРН внесения в ЕГРИП записи ...</td-->
									<!--td class="graphMain bordered">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в  сведениях  о приостановлении действия лицензии</td>
									<td class="graphMain bordered">ГРН внесения в ЕГРИП записи о выдаче лицензии</td>
									<td class="graphMain bordered">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в сведениях о выдаче лицензии</td-->
								<!--tr>
								<xsl:for-each select="feip_req:SvIP_SvLicenzija">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if-->
					<xsl:if test="feip_req:SvIP_SvZapEGRIP">
						<div class="title marg-top">Сведения о записях, внесенных в ЕГРИП</div>
						<table class="bordered w190">
							<xsl:for-each select="feip_req:SvIP_SvZapEGRIP">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
					<div>Данные получены из ЕГРИП с использованием вида сведений ФНС России "Выписки из ЕГРИП по запросам органов государственной власти"</div>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="feip_req:AdrRO|feip_req:SvIP_SvAdrMZh_AdresRF">
		<table class="w190">
			<xsl:if test="RUScat_ru:AddressKindCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида адреса</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AddressKindCode"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostalCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:PostalCode"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
				<tr>
					<td class="annot graphMain" style="width:50%">Страна в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="RUScat_ru:CountryCode"><xsl:value-of select="RUScat_ru:CountryCode"/><xsl:text> </xsl:text></xsl:if>
						<xsl:if test="RUScat_ru:CounryName"><xsl:value-of select="RUScat_ru:CounryName"/></xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<tr>
					<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Region"/></td>
				</tr>
			</xsl:if>	
			<xsl:if test="RUScat_ru:District">
				<tr>
					<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:District"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<tr>
					<td class="annot graphMain" style="width:50%">Город</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Town"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:City"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:StreetHouse"/></td>
				</tr>
			</xsl:if>	
			<xsl:if test="RUScat_ru:House">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:House"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Room"/></td>
				</tr>
			</xsl:if>		
			<xsl:if test="RUScat_ru:AddressText">
				<tr>
					<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AddressText"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OKTMO"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OKATO"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<tr>
					<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:KLADR"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<tr>
					<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AOGUID"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOID">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AOID"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:TerritoryCode"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:PostOfficeBoxId"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="name(.)='feip_req:SvIP_SvAdrMZh_AdresRF'">
				<xsl:if test="feip_req:GrnipData">
					<tr>
						<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
						<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipData"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="feip_req:GrnipDataIspr">
					<tr>
						<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
						<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipDataIspr"/></td>
					</tr>				
				</xsl:if>
			</xsl:if>
		</table>	
	</xsl:template>
	<!-- Шаблон для типа feip_req:GrnipDataType -->
	<xsl:template match="feip_req:GrnipDataIsprPred| feip_req:GrnipDataNedPred| feip_req:GrnipDataNed">
		<xsl:if test="feip_req:IdZap">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="feip_req:IdZap"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="feip_req:GRNIP">
			<xsl:value-of select="feip_req:GRNIP"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="feip_req:DataZap">
			<xsl:text>дата внесения: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="feip_req:DataZap"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="feip_req:MestoDejjstLic">
		<xsl:if test="cat_ru:PostalCode"><xsl:value-of select="cat_ru:PostalCode"/>, </xsl:if>
		<xsl:if test="cat_ru:CountryCode"><xsl:value-of select="cat_ru:CountryCode"/>, </xsl:if>
		<xsl:if test="cat_ru:CounryName"><xsl:value-of select="cat_ru:CounryName"/>, </xsl:if>
		<xsl:if test="cat_ru:Region"><xsl:value-of select="cat_ru:Region"/>, </xsl:if>
		<xsl:if test="cat_ru:City"><xsl:value-of select="cat_ru:City"/>, </xsl:if>
		<xsl:if test="cat_ru:StreetHouse"><xsl:value-of select="cat_ru:StreetHouse"/> </xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">(код: <xsl:value-of select="cat_ru:TerritoryCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="feip_req:SvedPredDocs">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> №</xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvAdrElPochtaType -->
	<xsl:template match="feip_req:SvIP_SvAdrElPochta">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес электронной почты индивидуального предпринимателя или крестьянского (фермерского) хозяйства</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:Email"/></td>
			</tr>
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipData"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipDataIspr"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="feip_req:SvIP_SvFL_FIORus|feip_req:SvIP_SvFL_FIOLat">
		<tr>
			<td class="annot graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="name(.)='feip_req:SvIP_SvFL_FIORus'">ФИО физического лица на русском языке</xsl:when>
					<xsl:when test="name(.)='feip_req:SvIP_SvFL_FIOLat'">ФИО физического лица с использованием букв латинского алфавита</xsl:when>
				</xsl:choose>
			</td>
			<td class="value graphMain" style="width:50%">
				<xsl:value-of select="cat_ru:PersonSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:PersonName"/>
				<xsl:if test="cat_ru:PersonMiddleName">
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:PersonMiddleName"/>
				</xsl:if>
			</td>
		</tr>
		<xsl:if test="cat_ru:PersonPost">
			<tr>
				<td class="annot graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="name(.)='feip_req:SvIP_SvFL_FIORus'">Должность на русском языке</xsl:when>
						<xsl:when test="name(.)='feip_req:SvIP_SvFL_FIOLat'">Должность с использованием букв латинского алфавита</xsl:when>
					</xsl:choose>
				</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonPost"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feip_req:GrnipType -->
	<xsl:template match="feip_req:SvIP_SvFL_GrnipData| feip_req:SvIP_SvFL_GrnipDataIspr| feip_req:GrnipData| feip_req:SvPriostLic_GrnipData| feip_req:SvPriostLic_GrnipDataIspr| feip_req:GrnipDataSvidNed| feip_req:GrnipDataIspr">
		<xsl:if test="feip_req:Grnip">
			<xsl:value-of select="feip_req:Grnip"/>
		</xsl:if>
		<xsl:if test="feip_req:GrnipRecordDate">
			<xsl:text> дата внесения:</xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="feip_req:GrnipRecordDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvGrazhdType -->
	<xsl:template match="feip_req:SvIP_SvGrazhd">
		<table class="w190">
			<xsl:if test="feip_req:VidGrazhd">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид гражданства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="feip_req:VidGrazhd='1'">
								<xsl:text>гражданин Российской Федерации</xsl:text>
							</xsl:when>
							<xsl:when test="feip_req:VidGrazhd='2'">
								<xsl:text>иностранный гражданин</xsl:text>
							</xsl:when>
							<xsl:when test="feip_req:VidGrazhd='3'">
								<xsl:text>лицо без гражданства</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="feip_req:VidGrazhd"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:OKSM or feip_req:NaimStran">
				<tr>
					<td class="annot graphMain" style="width:50%">Cтрана, гражданином которой является физическое лицо</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="feip_req:OKSM">
							<xsl:text>(</xsl:text>
							<xsl:value-of select="feip_req:OKSM"/>
							<xsl:text>)  </xsl:text>
						</xsl:if>
						<xsl:if test="feip_req:NaimStran"><xsl:value-of select="feip_req:NaimStran"/></xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feip_req:GrnipData"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feip_req:GrnipDataIspr"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvLicenzijaType -->
	<xsl:template match="feip_req:SvIP_SvLicenzija">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="feip_req:SerNomLic"/>
			</td>
			<!--td class="graphMain bordered">
				<xsl:value-of select="feip_req:NomLic"/>
			</td-->
			<td class="graphMain bordered">
				<xsl:value-of select="feip_req:VidLic"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feip_req:DataLic"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feip_req:DataNachLic"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feip_req:DataOkonchLic"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="feip_req:NaimLicVidDejat"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="feip_req:MestoDejjstLic">
					<xsl:for-each select="feip_req:MestoDejjstLic">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="feip_req:LicOrgVydLic"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feip_req:SvPriostLic_DataPriostLic"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="feip_req:SvPriostLic_LicOrgPriostLic"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="feip_req:SvPriostLic_GrnipData">
					<xsl:text>о приостановлении действия лицензии: </xsl:text>
					<xsl:apply-templates select="feip_req:SvPriostLic_GrnipData"/>
					<br/>
				</xsl:if>
				<xsl:if test="feip_req:SvPriostLic_GrnipDataIspr">
					<xsl:text>об исправлении технической ошибки в сведениях о приостановлении действия лицензии: </xsl:text>
					<xsl:apply-templates select="feip_req:SvPriostLic_GrnipDataIspr"/>
					<br/>
				</xsl:if>
				<xsl:text>о выдаче лицензии: </xsl:text>
				<xsl:apply-templates select="feip_req:GrnipData"/>
				<br/>
				<xsl:if test="feip_req:GrnipDataIspr">
					<xsl:text>об исправлении технической ошибки в сведениях о выдаче лицензии: </xsl:text>
					<xsl:apply-templates select="feip_req:GrnipDataIspr"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SSvIP_SvOKVEDType -->
	<xsl:template match="feip_req:SvIP_SvOKVED">
		<xsl:if test="feip_req:SvOKVEDOsn">
			<div class="title marg-top">Сведения об основном виде деятельности</div>
			<table class="bordered w190">
				<xsl:apply-templates select="feip_req:SvOKVEDOsn"/>
			</table>
		</xsl:if>
		<xsl:if test="feip_req:SvOKVEDDop">
			<div class="title marg-top">Сведения о дополнительном виде деятельности</div>
			<table class="bordered w190">
				<xsl:apply-templates select="feip_req:SvOKVEDDop"/>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvPravZhitRFType -->
	<xsl:template match="feip_req:SvIP_SvPravZhitRF|feip_req:SvIP_SvUdLichnFL">
		<table class="w190">
			<xsl:if test="cat_ru:IdentityCardCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardCode"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardName">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardSeries">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardNumber">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardNumber"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="cat_ru:OrganizationName"><xsl:value-of select="cat_ru:OrganizationName"/></xsl:if>
						<xsl:if test="RUScat_ru:IssuerCode">
							<xsl:text> (код подразделения: </xsl:text>
							<xsl:value-of select="RUScat_ru:IssuerCode"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:FullIdentityCardName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование вида документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:AuthorityId">
				<tr>
					<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:AuthorityId"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:CountryCode"/>
					</td>
				</tr>
			</xsl:if>		
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feip_req:GrnipData"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feip_req:GrnipDataIspr"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="name(.)='feip_req:SvIP_SvPravZhitRF'">
				<tr>
					<td class="annot graphMain" style="width:50%">Срок действия документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feip_req:SrokDejjstvDok"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvPrekraschType -->
	<xsl:template match="feip_req:SvIP_SvPrekrasch">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код способа прекращения по справочнику СИПСТ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="feip_req:KodStatus"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование способа прекращения по справочнику СИПСТ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="feip_req:NaimStatus"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата прекращения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="feip_req:DataPrekrasch"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="feip_req:GrnipData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipData"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feip_req:SvNovJuL">
			<div class="title marg-top">Сведения о юридическом лице, созданном на базе крестьянского (фермерского) хозяйства</div>
		</xsl:if>
		<xsl:apply-templates select="feip_req:SvNovJuL"/>
		<xsl:if test="feip_req:SvNovJuL">
			<div class="title marg-top">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</div>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvRegFSSType -->
	<xsl:template match="feip_req:SvIP_SvRegFSS">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер в исполнительном органе Фонда социального страхования РФ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:RegNomFSS"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="feip_req:DataReg"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--tr>
				<td class="annot graphMain" style="width:50%">Код по справочнику СТОФСС</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:KodFSS"/></td>
			</tr-->
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование исполнительного органа Фонда социального страхования</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:NaimFSS"/></td>
			</tr>
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:Grnip"/></td>
				</tr>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата внесения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feip_req:GrnipRecordDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipDataIspr"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvRegIPType -->
	<xsl:template match="feip_req:SvIP_SvRegIP">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Основной государственный регистрационный номер</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="feip_req:OGRNIP"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата присвоения ОГРНИП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="feip_req:DataOGRNIP"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="feip_req:RegNom">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер, присвоенный до 1 января 2004 года</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feip_req:RegNom"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feip_req:DataReg">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации до 1 января 2004 года</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feip_req:DataReg"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feip_req:NaimRO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование органа, зарегистрировавшего ИП или КФХ до 1 января 2004 года</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feip_req:NaimRO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feip_req:SvKFKh"/>
		<xsl:if test="feip_req:SvKFKh">
			<div class="title marg-top">Сведения о крестьянском (фермерском) хозяйстве, созданном до 1 января 1995 года, содержащиеся в ЕГРЮЛ</div>
		</xsl:if>
		<xsl:apply-templates select="feip_req:SvKFKh"/>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvRegOrgType -->
	<xsl:template match="feip_req:SvIP_SvRegOrg">
		<table class="w190">
			<!--tr>
				<td class="annot graphMain" style="width:50%">Код органа по справочнику СОНО</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:KodNO"/></td>
			</tr-->
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование регистрирующего (налогового) органа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:NaimNO"/></td>
			</tr>
		</table>
		<xsl:if test="feip_req:AdrRO">
			<div><u>Адрес регистрирующего органа:</u></div>
			<xsl:apply-templates select="feip_req:AdrRO"/>
		</xsl:if>
		<table class="w190">
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%"><br/>ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%"><br/><xsl:apply-templates select="feip_req:GrnipData"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvRegPFType -->
	<xsl:template match="feip_req:SvIP_SvRegPF">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер в территориальном органе Пенсионного фонда РФ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:RegNomPF"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="feip_req:DataReg"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--tr>
				<td class="annot graphMain" style="width:50%">Код по справочнику СТОПФ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:KodPF"/></td>
			</tr-->
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование территориального органа Пенсионного фонда</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:NaimPF"/></td>
			</tr>
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipData"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipDataIspr"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvRozhdType -->
	<xsl:template match="feip_req:SvIP_SvRozhd">
		<table class="w190">
			<xsl:if test="feip_req:DataRozhd">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата рождения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feip_req:DataRozhd"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:MestoRozhd">
				<tr>
					<td class="annot graphMain" style="width:50%">Место рождения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feip_req:MestoRozhd"/>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Признак полноты представляемой даты рождения физического лица</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="feip_req:PrDataRozhd='1'">только год (сведения о месяце и дне в указанном месяце отсутствуют)</xsl:when>
						<xsl:when test="feip_req:PrDataRozhd='2'">только месяц и код (сведения о дне в указанном месяце отсутствуют)</xsl:when>
						<xsl:when test="feip_req:PrDataRozhd='3' or not(feip_req:PrDataRozhd)">полная дата рождения</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="translate(feip_req:PrDataRozhd, '.', ',')"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feip_req:GrnipData"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feip_req:GrnipDataIspr"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvStatusType -->
	<xsl:template match="feip_req:SvIP_SvStatus">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код статуса по справочнику СИПСТ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:KodStatus"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование статуса по справочнику СИПСТ (состояние)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:NaimStatus"/></td>
			</tr>
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipData"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvIP_SvUchetNOType -->
	<xsl:template match="feip_req:SvIP_SvUchetNO">
		<table class="w190">
			<xsl:if test="feip_req:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН физического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:INN"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата постановки на учет в налоговом органе</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="feip_req:DataPostUch"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:if test="feip_req:DataSnyatUch">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата снятия с учета в налоговом органе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feip_req:DataSnyatUch"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<!--tr>
				<td class="annot graphMain" style="width:50%">Код органа по справочнику СОНО</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:KodNO"/></td>
			</tr-->
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование регистрирующего (налогового) органа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:NaimNO"/></td>
			</tr>
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipData"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipDataIspr"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<!-- Шаблон для типа feip_req:SvIP_SvZapEGRIPType -->
	<xsl:template match="feip_req:SvIP_SvZapEGRIP">
		<tr>
			<td colspan="2" class="value graphMain"><xsl:value-of select="position()"/></td>
		</tr>
		<!--tr>
			<td class="annot graphMain" style="width:50%">Системный идентификатор записи</td>
			<td class="value graphMain">
				<xsl:value-of select="feip_req:IdZap"/>
			</td>
		</tr-->
		<tr>
			<td class="annot graphMain" style="width:50%">Государственный регистрационный номер записи</td>
			<td class="value graphMain">
				<xsl:value-of select="feip_req:GRNIP"/>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Дата внесения записи в ЕГРИП</td>
			<td class="value graphMain">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feip_req:DataZap"/>
				</xsl:call-template>
			</td>
		</tr>
		<!--tr>
			<td class="annot graphMain" style="width:50%">Код вида записи (причины внесения записи в ЕГРЮЛ) по справочнику СПВЗ</td>
			<td class="value graphMain">
				<xsl:value-of select="feip_req:VidZap_KodSPVZ"/>
			</td>
		</tr-->
		<tr>
			<td class="annot graphMain" style="width:50%">Наименование вида записи (причины внесения записи в ЕГРЮЛ)</td>
			<td class="value graphMain">
				<xsl:value-of select="feip_req:VidZap_NaimVidZap"/>
			</td>
		</tr>
		<!--tr>
			<td class="annot graphMain" style="width:50%">Код органа по справочнику СОНО</td>
			<td class="value graphMain">
				<xsl:value-of select="feip_req:SvRegOrg_KodNO"/>
			</td>
		</tr-->
		<tr>
			<td class="annot graphMain" style="width:50%">Наименование регистрирующего (налогового) органа</td>
			<td class="value graphMain">
				<xsl:value-of select="feip_req:SvRegOrg_NaimNO"/>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Сведения о документах, представленных при внесении записи в ЕГРИП</td>
			<td class="value graphMain">
				<xsl:if test="feip_req:SvedPredDocs">
					<xsl:for-each select="feip_req:SvedPredDocs">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Сведения о свидетельстве, подтверждающем факт внесения записи в ЕГРИП</td>
			<td class="value graphMain">
				<xsl:if test="feip_req:SvSvids">
					<xsl:for-each select="feip_req:SvSvids">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">ГРН и дата записи</td>
			<td class="value graphMain">
				<xsl:if test="feip_req:GrnipDataIsprPred">
					<xsl:text>в которую внесены исправления: </xsl:text>
					<xsl:apply-templates select="feip_req:GrnipDataIsprPred"/>
					<br/>
				</xsl:if>
				<xsl:if test="feip_req:GrnipDataNedPred">
					<xsl:text>которая признана недействительной: </xsl:text>
					<xsl:apply-templates select="feip_req:GrnipDataNedPred"/>
					<br/>
				</xsl:if>
				<xsl:if test="feip_req:GrnipDataNed">
					<xsl:text>которой данная запись признана недействительной: </xsl:text>
					<xsl:apply-templates select="feip_req:GrnipDataNed"/>
					<br/>
				</xsl:if>
				<xsl:if test="feip_req:GrnipDataIspr">
					<xsl:text>которой внесены исправления в данную запись в связи с технической ошибкой: </xsl:text>
					<xsl:apply-templates select="feip_req:GrnipDataIspr"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvKFKhType -->
	<xsl:template match="feip_req:SvKFKh">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ОГРН юридического лица</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:OGRN"/></td>
			</tr>
			<xsl:if test="feip_req:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН юридического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:INN"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Полное наименование юридического лица</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:NaimJuLPoln"/></td>
			</tr>
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipData"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipDataIspr"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvNovJuLType -->
	<xsl:template match="feip_req:SvNovJuL">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Основной государственный регистрационный номер юридического лица, созданного на базе имущества крестьянского (фермерского) хозяйства</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:OGRN"/></td>
			</tr>
			<xsl:if test="feip_req:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН юридического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="feip_req:INN"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:NaimJuLPoln">
				<tr>
					<td class="annot graphMain" style="width:50%">Полное наименование юридического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:NaimJuLPoln"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipData">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipData"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="feip_req:GrnipDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="feip_req:GrnipDataIspr"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvOKVEDType -->
	<xsl:template match="feip_req:SvOKVEDOsn|feip_req:SvOKVEDDop">
		<tr>
			<td class="annot graphMain" colspan="2"><xsl:value-of select="position()"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Код по ОКВЭД</td>
			<td class="value graphMain">
				<xsl:value-of select="feip_req:KodOKVED"/>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Признак версии ОКВЭД</td>
			<td class="value graphMain">
				<xsl:value-of select="feip_req:PrVersOKVED"/>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Наименование вида деятельности по ОКВЭД</td>
			<td class="value graphMain">
				<xsl:apply-templates select="feip_req:NaimOKVED"/>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи, содержащей указанные сведения</td>
			<td class="value graphMain">
				<xsl:if test="feip_req:GrnipData">
					<xsl:apply-templates select="feip_req:GrnipData"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">ГРН внесения в ЕГРИП записи об исправлении технической ошибки в указанных сведениях</td>
			<td class="value graphMain">
				<xsl:if test="feip_req:GrnipDataIspr">
					<xsl:apply-templates select="feip_req:GrnipDataIspr"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feip_req:SvidType -->
	<xsl:template match="feip_req:SvSvids">
		<xsl:if test="feip_req:Seria">
			<xsl:text>серия: </xsl:text>
			<xsl:value-of select="feip_req:Seria"/>
			<xsl:text> </xsl:text>	
		</xsl:if>
		<xsl:if test="feip_req:Nomer">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="feip_req:Nomer"/>
			<xsl:text> </xsl:text>	
		</xsl:if>
		<xsl:if test="feip_req:DataVid">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="feip_req:DataVid"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="feip_req:GrnipDataSvidNed">
			<xsl:text>внесение в ЕГРИП записи, содержащей сведения о признании свидетельства недействительным по решению суда: </xsl:text>
			<xsl:apply-templates select="feip_req:GrnipDataSvidNed"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для формирования даты -->
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
