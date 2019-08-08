<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:feul_req="urn:customs.ru:Information:SQDocuments:FNSEGRULResponse:5.13.3">
	<!-- Шаблон для типа FNSEGRULResponseType -->
	<xsl:template match="feul_req:FNSEGRULResponse">
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

					div.title, tr.title td { font-weight:bold; text-align: center }
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
										ЕДИНЫЙ ГОСУДАРСТВЕННЫЙ РЕЕСТР ЮРИДИЧЕСКИХ ЛИЦ
									</font>
									<br/>
									<br/>
									<font size="4">
										Сведения о юридичеком лице
									</font>
									<br/>
									<br/>
									<xsl:apply-templates select="feul_req:SvJuL_SvNaimJuL/feul_req:NaimJuLPoln"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>ОГРН <xsl:value-of select="feul_req:SvJuL_OGRN"/></td>
							</tr>
							<tr>
								<td>ИНН <xsl:value-of select="feul_req:SvJuL_INN"/></td>
							</tr>
							<tr>
								<td>по состоянию на
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="feul_req:SvJuL_DataVyp"/>
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
					<xsl:if test="feul_req:SvJuL_SvNaimJuL">
						<div class="title marg-t1"><u>Сведения о наименовании юридического лица</u></div>
						<xsl:apply-templates select="feul_req:SvJuL_SvNaimJuL"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvAdresUL">
						<div class="title marg-t1">
							<u>Сведения об адресе (месте нахождения)</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvAdresUL"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvAdrElPochta">
						<div class="title marg-top">
							<u>Сведения об адресе электронной почты юридического лица</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvAdrElPochta"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvObrJuL">
						<div class="title marg-t1">
							<u>Сведения о регистрации (образовании) юридического лица</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvObrJuL"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvRegOrg">
						<div class="title marg-t1">
							<u>Сведения о регистрирующем органе по месту нахождения юридического лица</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvRegOrg"/>
					</xsl:if>
					<!--xsl:if test="feul_req:SvJuL_SvStatus">
						<div class="title marg-top">
							<u>Сведения о состоянии (статусе) юридического лица</u>
						</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title" bgcolor="#e3e3e3">
									<td class="graphMain bordered" colspan="2">Юридическое лицо по справочнику СЮЛСТ</td>
									<td class="graphMain bordered" colspan="4">Решение о предстоящем исключении недействующего ЮЛ из ЕГРЮЛ</td>
									<td class="graphMain bordered" rowspan="2">Запись ...</td>
								</tr>
								<tr class="title" bgcolor="#e3e3e3">
									<td class="graphMain bordered">Код статуса юр. лица</td>
									<td class="graphMain bordered">Наименование статуса</td>
									<td class="graphMain bordered">Дата решения</td>
									<td class="graphMain bordered">Номер решения</td>
									<td class="graphMain bordered">Дата публикации решения</td>
									<td class="graphMain bordered">Номер журнала, в котором опубликовано решение</td>
								</tr>
								<xsl:for-each select="feul_req:SvJuL_SvStatus">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if-->
					<xsl:if test="feul_req:SvJuL_SvPrekrJuL">
						<div class="title marg-t1">
							<u>Сведения о прекращении юридического лица</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvPrekrJuL"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvUchetNO">
						<div class="title marg-t1">
							<u>Сведения об учете в налоговом органе</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvUchetNO"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvRegPF">
						<div class="title marg-t1">
							<u>Сведения о регистрации юридического лица в качестве страхователя в территориальном органе ПФР</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvRegPF"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvRegFSS">
						<div class="title marg-t1">
							<u>Сведения о регистрации юридического лица в качестве страхователя в исполнительном органе Фонда социального страхования РФ</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvRegFSS"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvUstKap">
						<div class="title marg-t1">
							<u>Сведения о размере указанного в учредительных документах коммерческой организации уставного капитала<br/>(складочного капитала, уставного фонда, паевого фонда)</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvUstKap"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvUprOrgs">
						<div class="title marg-t1">
							<u>Сведения об управляющей организации</u>
						</div>
						<br/>
						<xsl:variable name="kol_vo">
							<xsl:value-of select="count(feul_req:SvJuL_SvUprOrgs)"/>
						</xsl:variable>
						<xsl:for-each select="feul_req:SvJuL_SvUprOrgs">
							<xsl:if test="$kol_vo &gt; 1">
								<table class="w190">
									<tr class="title" bgcolor="silver">
										<td>Организация № <xsl:value-of select="position()"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:apply-templates select="."/>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvedDolzhnFL">
						<div class="title marg-t1">
							<u>Сведения о лице, имеющем право без доверенности действовать от имени юридического лица</u>
						</div>
						<br/>
						<xsl:variable name="kol_vo">
							<xsl:value-of select="count(feul_req:SvJuL_SvedDolzhnFL)"/>
						</xsl:variable>
						<xsl:for-each select="feul_req:SvJuL_SvedDolzhnFL">
							<xsl:if test="$kol_vo &gt; 1">
								<table class="w190">
									<tr class="title" bgcolor="silver">
										<td>Организация № <xsl:value-of select="position()"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:apply-templates select="."/>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvUchredit">
						<div class="title marg-t1">
							<u>Сведения об учредителях (участниках) юридического лица</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvUchredit"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvDergReesrtAO">
						<div class="title marg-t1">
							<u>Сведения о держателе реестра акционеров акционерного общества</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvDergReesrtAO"/>
					</xsl:if>
					<!--xsl:if test="feul_req:SvJuL_SvOKVED">
						<div class="title marg-top">
							<u>Сведения о видах экономической деятельности по Общероссийскому классификатору видов экономической деятельности</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvOKVED"/>
					</xsl:if-->
					<xsl:if test="feul_req:SvJuL_SvLicenzija">
						<div class="title marg-t1">
							<u>Сведения о лицензиях, выданных ЮЛ</u>
						</div>
						<xsl:variable name="kol_vo">
							<xsl:value-of select="count(feul_req:SvJuL_SvLicenzija)"/>
						</xsl:variable>
						<xsl:for-each select="feul_req:SvJuL_SvLicenzija">
							<xsl:if test="$kol_vo &gt; 1">
								<br/>
								<table>
									<tr class="title" bgcolor="#e3e3e3">
										<td class="annot graphMain">Лицензия № <xsl:value-of select="position()"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvPodrazd">
						<div class="title marg-t1">
							<u>Сведения об обособленных подразделениях юридического лица</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvPodrazd"/>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvReorgs">
						<div class="title marg-t1">
							<u>Сведения об участии в реорганизации</u>
						</div>
						<xsl:variable name="kol_vo">
							<xsl:value-of select="count(feul_req:SvJuL_SvReorgs)"/>
						</xsl:variable>
						<xsl:for-each select="feul_req:SvJuL_SvReorgs">
							<xsl:if test="$kol_vo &gt; 1">
								<table>
									<tr class="title" bgcolor="#e3e3e3">
										<td class="annot graphMain">Юр. лицо № <xsl:value-of select="position()"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:apply-templates select="."/>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvPredsh">
						<div class="title marg-t1">
							<u>Сведения о правопредшественнике</u>
						</div>
						<xsl:variable name="kol_vo">
							<xsl:value-of select="count(feul_req:SvJuL_SvPredsh)"/>
						</xsl:variable>
						<xsl:for-each select="feul_req:SvJuL_SvPredsh">
							<xsl:if test="$kol_vo &gt; 1">
								<br/>
								<table>
									<tr class="title" bgcolor="#e3e3e3">
										<td class="annot graphMain">Юр. лицо № <xsl:value-of select="position()"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</xsl:if>
					<!--xsl:if test="feul_req:SvJuL_SvKFXPredsh">
						<div class="title marg-top">
							<u>Сведения о крестьянском (фермерском) хозяйстве, на базе имущества которого создано юридическое лицо</u>
						</div>
						<xsl:variable name="kol_vo">
							<xsl:value-of select="count()"/>
						</xsl:variable>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Сведения о ФИО и (при наличии) ИНН главы КФХ</td>
									<td class="graphMain bordered">ОГРНИП крестьянского (фермерского) хозяйства</td>
								</tr>
								<xsl:for-each select="feul_req:SvJuL_SvKFXPredsh">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if-->
					<xsl:if test="feul_req:SvJuL_SvPreemn">
						<div class="title marg-t1">
							<u>Сведения о правопреемнике</u>
						</div>
						<xsl:variable name="kol_vo">
							<xsl:value-of select="count(feul_req:SvJuL_SvPreemn)"/>
						</xsl:variable>
						<xsl:for-each select="feul_req:SvJuL_SvPreemn">
							<xsl:if test="$kol_vo &gt; 1">
								<br/>
								<table>
									<tr class="title" bgcolor="#e3e3e3">
										<td class="annot graphMain">Юр. лицо № <xsl:value-of select="position()"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:apply-templates select="."/>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="feul_req:SvJuL_SvKFXPreemn">
						<div class="title marg-t1">
							<u>Сведения о крестьянском (фермерском) хозяйстве, которые внесены в ЕГРИП в связи с приведением правового статуса крестьянского (фермерского)<br/>хозяйства в соответствие с нормами части первой Гражданского кодекса Российской Федерации</u>
						</div>
						<xsl:apply-templates select="feul_req:SvJuL_SvKFXPreemn"/>
					</xsl:if>
					<div class="title marg-t1">
						<u>Сведения о записях, внесенных в ЕГРЮЛ</u>
					</div>
					<xsl:variable name="kol_vo">
						<xsl:value-of select="count(feul_req:SvJuL_SvZapEGRUL)"/>
					</xsl:variable>
					<xsl:for-each select="feul_req:SvJuL_SvZapEGRUL">
						<xsl:if test="$kol_vo &gt; 1">
							<br/>
							<table>
								<tr class="title" bgcolor="#e3e3e3">
									<td class="annot graphMain">Запись № <xsl:value-of select="position()"/>
									</td>
								</tr>
							</table>
						</xsl:if>
						<xsl:apply-templates select="."/>
						<br/>
					</xsl:for-each>
					<div>Данные получены из ЕГРЮЛ с использованием вида сведений ФНС России "Выписки из ЕГРЮЛ по запросам органов государственной власти"</div>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ITNReserv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGINN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGOKPO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KPP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:BIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:AdresRFType -->
	<xsl:template match="feul_req:AdresMZhRF | feul_req:AdrMGRF | feul_req:AdrMNRF | feul_req:SvAdrRF | feul_req:AdrStr | feul_req:AdresRF | feul_req:AdrRO">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид адреса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AddressKindCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:District"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Город</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Town"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:House"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Room"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AddressText"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OKTMO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OKATO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:KLADR"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AOGUID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AOID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер абонентского ящика</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="feul_req:AdrIn">
		<xsl:if test="cat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:AdresINType -->
	<xsl:template match="feul_req:AdrMNIn|feul_req:AdrMZhIn|feul_req:DataOtkrNasl">
		<xsl:if test="feul_req:OKSM">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:OKSM"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimStran">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование страны</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimStran"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:AdrIn">
			<div class="title marg-top">Адрес</div>
			<xsl:apply-templates select="feul_req:AdrIn"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:DoljaUstKapEGRULType -->
	<xsl:template match="feul_req:DoljaUstKap">
		<xsl:if test="feul_req:NominStoim">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номинальная стоимость доли в рублях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(feul_req:NominStoim, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:Prosent">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Размер доли в процентах</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(feul_req:Prosent, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DrobDes">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Размер доли в десятичных дробях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(feul_req:DrobDes, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DrobProst">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Размер доли в простых дробях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:DrobProst"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:GrnDataType -->
	<xsl:template match="feul_req:GrnData|feul_req:GrnDataIspr|feul_req:GrnDataPerv|feul_req:GrnDataNed">
		<xsl:if test="feul_req:Id">
			<xsl:text>(ID: </xsl:text>
			<xsl:value-of select="feul_req:Id"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="feul_req:Grn">
			<xsl:text>ГРН: </xsl:text>
			<xsl:value-of select="feul_req:Grn"/>
		</xsl:if>
		<xsl:if test="feul_req:RecordDate">
			<xsl:text> дата внесения записи в ЕГРЮЛ: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="feul_req:RecordDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:GrnInfoType -->
	<xsl:template match="feul_req:GrnInfo">
		<xsl:if test="feul_req:GrnData">
			<div class="title marg-top">Запись, содержащей указанные сведения</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnData"/>
		<xsl:if test="feul_req:GrnDataIspr">
			<div class="title marg-top">Запись об исправлении технической ошибки в указанных сведениях</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnDataIspr"/>
		<xsl:if test="feul_req:GrnDataPerv">
			<div class="title marg-top">Запись сведений о данном лице</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnDataPerv"/>
	</xsl:template>
	<!-- Шаблон для типа feul_req:LicoUprNaslType -->
	<xsl:template match="feul_req:LicoUprNasl">
		<xsl:if test="feul_req:SvFl">
			<div class="title marg-top">Сведения о ФИО и (при наличии) ИНН ФЛ</div>
			<xsl:apply-templates select="feul_req:SvFl"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRojdFL">
			<div class="title marg-top">Сведения о рождении ФЛ</div>
			<xsl:apply-templates select="feul_req:SvRojdFL"/>
		</xsl:if>
		<xsl:if test="feul_req:UdLichnFL">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность</div>
			<xsl:apply-templates select="feul_req:UdLichnFL"/>
		</xsl:if>
		<xsl:if test="feul_req:AdresMZhRF">
			<div class="title marg-top">Сведения об адресе места жительства в Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdresMZhRF"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMZhIn">
			<div class="title marg-top">Сведения об адресе места жительства за пределами территории Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdrMZhIn"/>
		</xsl:if>
		<xsl:if test="feul_req:DataOtkrNasl">
			<div class="title marg-top">Дата открытия наследства (дата смерти участника)</div>
			<xsl:apply-templates select="feul_req:DataOtkrNasl"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<div class="title marg-top">Запись сведений о данном лице</div>
			<xsl:apply-templates select="feul_req:GrnDataPerv"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvJulEGRULType -->
	<xsl:template match="feul_req:NaimINNUL|feul_req:UprOrgPif|feul_req:DergReesrtAO|feul_req:NaimINNDovUpr">
		<xsl:if test="feul_req:UchrOrganization">
			<div class="title marg-top">Юр.лицо - учредитель (участник), управляющая организация, залогодержатель, управляющий долей участник, внесенные в ЕГРЮЛ</div>
			<xsl:apply-templates select="feul_req:UchrOrganization"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись, содержащей указанные сведения</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись об исправлении технической ошибки в указанных сведениях</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:PredInULType -->
	<xsl:template match="feul_req:PredInUL">
		<xsl:if test="feul_req:SvFlINNFl">
			<div class="title marg-top">Сведения о ФИО и (при наличии) ИНН ФЛ</div>
			<xsl:apply-templates select="feul_req:SvFlINNFl"/>
		</xsl:if>
		<xsl:if test="feul_req:SvNomTel">
			<div class="title marg-top">Сведения о контактном телефоне ФЛ</div>
			<xsl:apply-templates select="feul_req:SvNomTel"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRojdFL">
			<div class="title marg-top">Сведения о рождении ФЛ</div>
			<xsl:apply-templates select="feul_req:SvRojdFL"/>
		</xsl:if>
		<xsl:if test="feul_req:UdLichnFL">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность</div>
			<xsl:apply-templates select="feul_req:UdLichnFL"/>
		</xsl:if>
		<xsl:if test="feul_req:AdresMZhRF">
			<div class="title marg-top">Сведения об адресе места жительства в Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdresMZhRF"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMZhIn">
			<div class="title marg-top">Сведения об адресе места жительства за пределами территории Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdrMZhIn"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:ReshSudType -->
	<xsl:template match="feul_req:ReshSud">
		<xsl:if test="feul_req:NaimSud">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование суда, которым принято решение</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="feul_req:NaimSud">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:Nomer">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер решения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:Nomer"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:Data">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата решения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:Data"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:FractionType -->
	<xsl:template match="feul_req:RubFraction|feul_req:DrobProst">
		<xsl:value-of select="feul_req:Chislit"/>
		<xsl:text> / </xsl:text>
		<xsl:value-of select="feul_req:Znamenat"/>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvDiskvType -->
	<xsl:template match="feul_req:SvDiskv">
		<tr>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feul_req:DataNachDiskv"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feul_req:DataOkonchDiskv"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feul_req:DataResh"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="feul_req:GrnData">
					<xsl:text>содержащей указанные сведения: </xsl:text>
					<xsl:apply-templates select="feul_req:GrnData"/>
				</xsl:if>
				<xsl:if test="feul_req:GrnDataIspr">
					<xsl:text>об исправлении технической ошибки в указанных сведениях: </xsl:text>
					<xsl:apply-templates select="feul_req:GrnDataIspr"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvDolzhnType -->
	<xsl:template match="feul_req:SvDolzhn">
		<xsl:if test="feul_req:OGRNIP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Основной государственный регистрационный номер индивидуального предпринимателя - управляющего юридическим лицом</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:OGRNIP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:VidDolzhn">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид должностного лица по справочнику СКФЛЮЛ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:VidDolzhn"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimVidDolzhn">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование вида должностного лица по справочнику СКФЛЮЛ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimVidDolzhn"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimDolzhn">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование должности</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimDolzhn"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvDovUprFLType -->
	<xsl:template match="feul_req:SvDovUprFL">
		<xsl:if test="feul_req:SvFl">
			<div class="title marg-top">Сведения о ФИО и (при наличии) ИНН ФЛ</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:SvFl"/>
		<xsl:if test="feul_req:SvRojdFL">
			<div class="title marg-top">Сведения о рождении ФЛ</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:SvRojdFL"/>
		<xsl:if test="feul_req:UdLichnFL">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:UdLichnFL"/>
		<xsl:if test="feul_req:AdresMZhRF">
			<div class="title marg-top">Сведения об адресе места жительства в Российской Федерации</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:AdresMZhRF"/>
		<xsl:if test="feul_req:AdrMZhIn">
			<div class="title marg-top">Сведения об адресе места жительства за пределами территории Российской Федерации</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:AdrMZhIn"/>
		<xsl:if test="feul_req:GrnDataPerv">
			<div class="title marg-top">Запись сведений о данном лице</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnDataPerv"/>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvDovUprULType -->
	<xsl:template match="feul_req:SvDovUprUL">
		<xsl:if test="feul_req:NaimINNDovUpr">
			<div class="title marg-top">Сведения о наименовании и (при наличии) ОГРН и ИНН ЮЛ</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:NaimINNDovUpr"/>
		<xsl:if test="feul_req:GrnDataPerv">
			<div class="title marg-top">Запись сведений о данном лице</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnDataPerv"/>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvedOtsAddresULType -->
	<xsl:template match="feul_req:SvedOtsAddresUL">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="feul_req:PriznOtsAdrUL='1'">
						<xsl:text>связь с юридическим лицом по указанному в ЕГРЮЛ адресу отсутствует</xsl:text>
					</xsl:when>
					<xsl:when test="feul_req:PriznOtsAdrUL='2'">
						<xsl:text>адрес, указанный юридическим лицом при государственной регистрации, не существует</xsl:text>
					</xsl:when>
					<xsl:when test="feul_req:PriznOtsAdrUL='3'">
						<xsl:text>сведения об адресе являются недостоверными на основании решения суда</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="feul_req:PriznOtsAdrUL"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:NaimSud"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:Nomer"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feul_req:Data"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="feul_req:GrnData">
					<xsl:text>содержащей указанные сведения: </xsl:text>
					<xsl:apply-templates select="feul_req:GrnData"/>
					<br/>
				</xsl:if>
				<xsl:if test="feul_req:GrnDataIspr">
					<xsl:text> об исправлении технической ошибки в указанных сведениях: </xsl:text>
					<xsl:apply-templates select="feul_req:GrnDataIspr"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvedPredDocType -->
	<xsl:template match="feul_req:SvedPredDoc">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:NaimDoc"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:NomDoc"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feul_req:DateDoc"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvedUmUKType -->
	<xsl:template match="feul_req:SvedUmUK">
		<xsl:if test="feul_req:VelUmUK">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Величина, на которую уменьшается уставный капитал (в рублях)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(feul_req:VelUmUK, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataResh">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата принятия решения об уменьшении уставного капитала</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(feul_req:DataResh, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvFilialType -->
	<xsl:template match="feul_req:SvFilial |feul_req:SvPodrazd">
		<xsl:if test="feul_req:SvNaim">
			<div class="title marg-top">Сведения о наименовании филиала</div>
			<xsl:apply-templates select="feul_req:SvNaim"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMNRF">
			<div class="title marg-top">Адрес (место расположения) на территории Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdrMNRF"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMNIn">
			<div class="title marg-top">Адрес (место расположения) за пределами территории Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdrMNIn"/>
		</xsl:if>
		<xsl:if test="feul_req:SvUchetNoFilial">
			<div class="title marg-top">Сведения об учете в налоговом органе по месту нахождения филиала/представительства</div>
			<xsl:apply-templates select="feul_req:SvUchetNoFilial"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<div class="title marg-top">Запись сведений о данном лице</div>
			<xsl:apply-templates select="feul_req:GrnDataPerv"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvFlType -->
	<xsl:template match="feul_req:SvFl">
		<xsl:if test="feul_req:SvFlINN">
			<div class="title marg-top">Сведения о ФИО и (при наличии) ИНН ФЛ</div>
			<xsl:apply-templates select="feul_req:SvFlINN"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRojd">
			<div class="title marg-top">Сведения о рождении</div>
			<xsl:apply-templates select="feul_req:SvRojd"/>
		</xsl:if>
		<xsl:if test="feul_req:UdLichFL">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность</div>
			<xsl:apply-templates select="feul_req:UdLichFL"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMGRF">
			<div class="title marg-top">Сведения об адресе места жительства в Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdrMGRF"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMZhIn">
			<div class="title marg-top">Сведения об адресе места жительства за пределами Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdrMZhIn"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись об исправлении технической ошибки в указанных сведениях</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvFlEGRULType -->
	<xsl:template match="feul_req:SvFlINN|feul_req:SvFL|feul_req:SvFlINNFl|feul_req:SvNotary">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:INNFL">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН ФЛ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:INNFL"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvFLOsushhPrType -->
	<xsl:template match="feul_req:SvFLOsushhPr">
		<xsl:if test="feul_req:SvFL">
			<div class="title marg-top">Сведения о ФИО и (при наличии) ИНН ФЛ</div>
			<xsl:apply-templates select="feul_req:SvFL"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRojdFL">
			<div class="title marg-top">Сведения о рождении ФЛ</div>
			<xsl:apply-templates select="feul_req:SvRojdFL"/>
		</xsl:if>
		<xsl:if test="feul_req:UdLichnFL">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность</div>
			<xsl:apply-templates select="feul_req:UdLichnFL"/>
		</xsl:if>
		<xsl:if test="feul_req:AdresMZhRF">
			<div class="title marg-top">Сведения об адресе места жительства в Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdresMZhRF"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMZhIn">
			<div class="title marg-top">Сведения об адресе места жительства за пределами территории Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdrMZhIn"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись, содержащей указанные сведения</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataPerv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvAdrElPochtaType -->
	<xsl:template match="feul_req:SvJuL_SvAdrElPochta">
		<xsl:if test="feul_req:E-mail">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:E-mail"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvAdresULType -->
	<xsl:template match="feul_req:SvJuL_SvAdresUL">
		<xsl:if test="feul_req:AdresRF">
			<div class="title marg-top">Адрес (место нахождения) юридического лица</div>
			<xsl:apply-templates select="feul_req:AdresRF"/>
		</xsl:if>
		<!--xsl:if test="feul_req:SvedOtsAddresUL">
			<div class="title marg-top">Сведения о недостоверности адреса или отсутствии связи с ЮЛ по указанному адресу</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title" bgcolor="#e3e3e3">
						<td class="graphMain bordered">Признак невозможности взаимодействия с юридическим лицом по содержащемуся в ЕГРЮЛ адресу</td>
						<td class="graphMain bordered">Наименование суда, которым принято решение</td>
						<td class="graphMain bordered">Номер решения</td>
						<td class="graphMain bordered">Дата решения</td>
						<td class="graphMain bordered">Запись ...</td>
					</tr>
					<xsl:for-each select="feul_req:SvedOtsAddresUL">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvDergReesrtAOType -->
	<xsl:template match="feul_req:SvJuL_SvDergReesrtAO">
		<xsl:if test="feul_req:DergReesrtAO"/>
		<xsl:if test="feul_req:DergReesrtAO">
			<div class="title marg-top">Наименование и (при наличии) ОГРН и ИНН держателе реестра акционеров акционерного общества</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:DergReesrtAO"/>
		<xsl:if test="feul_req:GrnDataPerv"/>
		<xsl:if test="feul_req:GrnDataPerv">
			<div class="title marg-top">Запись сведений о данном лице</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnDataPerv"/>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvedDolzhnFLType -->
	<xsl:template match="feul_req:SvJuL_SvedDolzhnFL">
		<xsl:if test="feul_req:SvFL">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения о ФИО и (при наличии) ИНН ФЛ</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvFL"/>
		</xsl:if>
		<xsl:if test="feul_req:SvDolzhn">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения о должности ФЛ</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvDolzhn"/>
		</xsl:if>
		<xsl:if test="feul_req:SvNomTel">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения о контактном телефоне ФЛ</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvNomTel"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRojdFL">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения о рождении ФЛ</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvRojdFL"/>
		</xsl:if>
		<xsl:if test="feul_req:UdLichnFL">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения о документе, удостоверяющем личность</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:UdLichnFL"/>
		</xsl:if>
		<xsl:if test="feul_req:AdresMZhRF">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения об адресе места жительства в Российской Федерации</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:AdresMZhRF"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMZhIn">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения об адресе места жительства за пределами территории Российской Федерации</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:AdrMZhIn"/>
		</xsl:if>
		<!--xsl:if test="feul_req:SvDiskv">
			<table class="bordered w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" colspan="4">Сведения о дисквалификации</td>
				</tr>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="graphMain bordered">Дата начала дисквалификации</td>
					<td class="graphMain bordered">Дата окончания дисквалификации</td>
					<td class="graphMain bordered">Дата вынесения судебным органом постановления о дисквалификации</td>
					<td class="graphMain bordered">Запись ...</td>
				</tr>
				<xsl:for-each select="feul_req:SvDiskv">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if-->
		<xsl:if test="feul_req:GrnDataPerv">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Запись сведений о данном лице</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:GrnDataPerv"/>
		</xsl:if>
		<xsl:if test="feul_req:SvUlOrg">
			<br/><br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения о физическом лице (резидент), имеющем право без доверенности действовать от имени юридического лица</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvUlOrg"/>
		</xsl:if>
		<xsl:if test="feul_req:SvUlForeignOrg">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения о физическом лице (не резидент), имеющем право без доверенности действовать от имени юридического лица</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvUlForeignOrg"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvKFXPredshType -->
	<xsl:template match="feul_req:SvJuL_SvKFXPredsh">
		<tr>
			<td class="graphMain bordered">
				<xsl:if test="feul_req:SvFL">
					<xsl:apply-templates select="feul_req:SvFL"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:OGRNIP"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvKFXPreemnType -->
	<xsl:template match="feul_req:SvJuL_SvKFXPreemn">
		<xsl:if test="feul_req:SvFL"/>
		<xsl:if test="feul_req:SvFL">
			<div class="title marg-top">Сведения о ФИО и (при наличии) ИНН главы КФХ</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:SvFL"/>
		<xsl:if test="feul_req:OGRNIP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРНИП крестьянского (фермерского) хозяйства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:OGRNIP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvLicenzijaType -->
	<xsl:template match="feul_req:SvJuL_SvLicenzija">
		<table class="w190">
			<xsl:if test="feul_req:SerLic">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:SerLic"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:NomLic">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NomLic"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:VidLic">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:VidLic"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:DataLic">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataLic"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:DataNachLic">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата начала действия лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataNachLic"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:DataOkonchLic">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата окончания действия лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataOkonchLic"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:NaimLicVidDejat">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование лицензируемого вида деятельности, на который выдана лицензия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimLicVidDejat"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:MestoDejjstLic">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об адресе места осуществления лицензируемого вида деятельности</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:MestoDejjstLic"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:LicOrgVydLic">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование лицензирующего органа, выдавшего или переоформившего лицензию</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:LicOrgVydLic"/>
					</td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="feul_req:SvPriostLic">
			<div class="title marg-top">Сведения о приостановлении действия лицензии</div>
			<xsl:apply-templates select="feul_req:SvPriostLic"/>
		</xsl:if>
		<table class="w190">
			<xsl:if test="feul_req:GrnDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<br/>
						<b>Запись об исправлении технической ошибки в указанных сведениях</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<br/>
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:GrnDataPerv">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись сведений о данном лице</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataPerv"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvNaimJuLType -->
	<xsl:template match="feul_req:SvJuL_SvNaimJuL">
		<xsl:if test="feul_req:NaimJuLPoln">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Полное наименование юридического лица на русском языке</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="feul_req:NaimJuLPoln">
							<xsl:value-of select="."/>
							<!--xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if-->
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimJuLSokr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сокращенное наименование юридического лица на русском языке</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimJuLSokr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvObrJuLType -->
	<xsl:template match="feul_req:SvJuL_SvObrJuL">
		<xsl:if test="feul_req:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Основной государственный регистрационный номер юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataOgrn">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата присвоения ОГРН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataOgrn"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:RegNom">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер, присвоенный российскому юридическому лицу</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:RegNom"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataReg">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataReg"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimRO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование органа, зарегистрировавшего юридическое лицо</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimRO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:KodSpObrJuL">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код способа образования по справочнику СЮЛНД</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KodSpObrJuL"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimSpObrJuL">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование способа образования юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimSpObrJuL"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvOKVEDType -->
	<xsl:template match="feul_req:SvJuL_SvOKVED">
		<xsl:if test="feul_req:SvOKVEDOsn">
			<div class="title marg-top">Сведения об основном виде деятельности</div>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="graphMain bordered">Код по Общероссийскому классификатору видов экономической деятельности</td>
					<td class="graphMain bordered">Наименование вида деятельности по Общероссийскому классификатору видов экономической деятельности</td>
					<td class="graphMain bordered">Признак версии Общероссийского классификатора видов экономической деятельности</td>
					<td class="graphMain bordered">Запись ... </td>
				</tr>
				<xsl:for-each select="feul_req:SvOKVEDOsn">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:SvOKVEDDop">
			<div class="title marg-top">Сведения о дополнительном виде деятельности</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title" bgcolor="#e3e3e3">
						<td class="graphMain bordered">Код по Общероссийскому классификатору видов экономической деятельности</td>
						<td class="graphMain bordered">Наименование вида деятельности по Общероссийскому классификатору видов экономической деятельности</td>
						<td class="graphMain bordered">Признак версии Общероссийского классификатора видов экономической деятельности</td>
						<td class="graphMain bordered">Запись ... </td>
					</tr>
					<xsl:for-each select="feul_req:SvOKVEDDop">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvPodrazdType -->
	<xsl:template match="feul_req:SvJuL_SvPodrazd">
		<xsl:if test="feul_req:SvFilial">
			<xsl:for-each select="feul_req:SvFilial">
				<br/>
				<table class="w190">
					<tr class="title" bgcolor="#e3e3e3">
						<td class="annot graphMain">Сведения о филиалах юридического лица № <xsl:value-of select="position()"/>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:SvPodrazd">
			<xsl:for-each select="feul_req:SvPodrazd">
				<br/>
				<table class="w190">
					<tr class="title" bgcolor="#e3e3e3">
						<td class="annot graphMain">Сведения о представительствах юридического лица № <xsl:value-of select="position()"/>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvPredshType -->
	<xsl:template match="feul_req:SvJuL_SvPredsh">
		<table class="w190">
			<xsl:if test="feul_req:OGRN">
				<tr>
					<td class="annot graphMain" style="width:50%">Основной государственный регистрационный номер юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:OGRN"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:INN"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:NaimULPoln">
				<tr>
					<td class="annot graphMain" style="width:50%">Полное наименование юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimULPoln"/>
					</td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="feul_req:SvUlSlojnReorg">
			<div class="title marg-top">Сведения о ЮЛ, путем реорганизации которого был создан правопредшественник при реорганизации в форме выделения<br/>или разделения с одновременным присоединением или слиянием</div>
			<xsl:apply-templates select="feul_req:SvUlSlojnReorg"/>
		</xsl:if>
		<table class="w190">
			<xsl:if test="feul_req:GrnData">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<br/>Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<br/>
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:GrnDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="feul_req:GrnDataIspr">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvPreemnType -->
	<xsl:template match="feul_req:SvJuL_SvPreemn">
		<table class="w190">
			<xsl:if test="feul_req:OGRN">
				<tr>
					<td class="annot graphMain" style="width:50%">Основной государственный регистрационный номер юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:OGRN"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:INN"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:NaimULPoln">
				<tr>
					<td class="annot graphMain" style="width:50%">Полное наименование юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimULPoln"/>
					</td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="feul_req:SvUlSlojnReorg">
			<div class="title marg-top">ИПолное наименование юридического лица</div>
			<xsl:apply-templates select="feul_req:SvUlSlojnReorg"/>
		</xsl:if>
		<table class="w190">
			<xsl:if test="feul_req:GrnData">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<br/>Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<br/>
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:GrnDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="feul_req:GrnDataIspr">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvPrekrJuLType -->
	<xsl:template match="feul_req:SvJuL_SvPrekrJuL">
		<xsl:if test="feul_req:DataPrekrJuL">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата прекращения юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataPrekrJuL"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:KodSpPrekrJuL">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код способа прекращения по справочнику СЮЛПД</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KodSpPrekrJuL"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimSpPrekrJuL">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование способа прекращения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimSpPrekrJuL"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="feul_req:KodNO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код органа по справочнику СОНО, внесшем запись о прекращении</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KodNO"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
		<xsl:if test="feul_req:NaimNO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование регистрирующего (налогового) органа, внесшего запись о прекращении</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimNO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvRegFSSType -->
	<xsl:template match="feul_req:SvJuL_SvRegFSS">
		<xsl:if test="feul_req:RegNomFSS">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер в исполнительном органе Фонда социального страхования Российской Федерации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:RegNomFSS"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataReg">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации юридического лица в качестве страхователя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataReg"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="feul_req:KodFSS">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код по справочнику СТОФСС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KodFSS"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
		<xsl:if test="feul_req:NaimFSS">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование ФСС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimFSS"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvRegOrgType -->
	<xsl:template match="feul_req:SvJuL_SvRegOrg">
		<xsl:if test="feul_req:KodNO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код органа по справочнику СОНО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KodNO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimNO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование регистрирующего (налогового) органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimNO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:AdrRO">
			<div class="title marg-top">Адрес регистрирующего органа</div>
			<xsl:apply-templates select="feul_req:AdrRO"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvRegPFType -->
	<xsl:template match="feul_req:SvJuL_SvRegPF">
		<xsl:if test="feul_req:RegNomPF">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер в территориальном органе Пенсионного фонда Российской Федерации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:RegNomPF"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataReg">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации юридического лица в качестве страхователя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataReg"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="feul_req:KodPF">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ПФР по справочнику СТОПФ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KodPF"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
		<xsl:if test="feul_req:NaimPF">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование ПФР</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimPF"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvReorgsType -->
	<xsl:template match="feul_req:SvJuL_SvReorgs">
		<table>
			<xsl:if test="feul_req:KodStatusUL">
				<tr>
					<td class="annot graphMain" style="width:50%">Код формы реорганизации (статуса) юридического лица по справочнику СЮЛСТ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KodStatusUL"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:NaimStatusUL">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование формы реорганизации (статуса) юридического лица по справочнику СЮЛСТ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimStatusUL"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:GrnData">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:GrnDataIspr">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="feul_req:GrnDataIspr">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</table>
		<!--xsl:if test="feul_req:SvReorgUl">
			<div class="title marg-top">Сведения о юридических лицах, участвующих в реорганизации</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title" bgcolor="#e3e3e3">
						<td class="graphMain bordered">Основной государственный регистрационный номер юридического лица</td>
						<td class="graphMain bordered">ИНН юридического лица</td>
						<td class="graphMain bordered">Полное наименование юридического лица</td>
						<td class="graphMain bordered">Состояние юридического лица после завершения реорганизации</td>
						<td class="graphMain bordered">Запись, содержащей указанные сведения</td>
						<td class="graphMain bordered">Запись об исправлении технической ошибки в указанных сведениях</td>
					</tr>
					<xsl:for-each select="feul_req:SvReorgUl">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvStatusType -->
	<xsl:template match="feul_req:SvJuL_SvStatus">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:KodStatusJuL"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:NaimStatusJuL"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feul_req:DataResh"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:NomerResh"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feul_req:DataPublic"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feul_req:JornalNomer"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="feul_req:GrnData">
					<xsl:text>содержащей указанные сведения: </xsl:text>
					<xsl:apply-templates select="feul_req:GrnData"/>
					<br/>
				</xsl:if>
				<xsl:if test="feul_req:GrnDataIspr">
					<xsl:text>об исправлении технической ошибки в указанных сведениях: </xsl:text>
					<xsl:apply-templates select="feul_req:GrnDataIspr"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvUchetNOType -->
	<xsl:template match="feul_req:SvJuL_SvUchetNO">
		<xsl:if test="feul_req:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KPP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataPostUch">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата постановки на учет в налоговом органе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataPostUch"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataSnyatUch">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата снятия с учета в налоговом органе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataSnyatUch"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:KodNO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код налогового органа по справочнику СОНО, в котором юридическое лицо состоит</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KodNO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimNO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование налогового органа, в котором юридическое лицо состоит</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimNO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvUchreditType -->
	<xsl:template match="feul_req:SvJuL_SvUchredit">
		<xsl:if test="feul_req:UchrJuLRos">
			<xsl:variable name="kol_vo">
				<xsl:value-of select="count(feul_req:UchrJuLRos)"/>
			</xsl:variable>
			<xsl:for-each select="feul_req:UchrJuLRos">
				<br/>
				<table class="bordered w190">
					<tr class="title" bgcolor="silver">
						<td class="annot graphMain">
							<xsl:text>Сведения об учредителе (участнике) - российском юридическом лице</xsl:text>
							<xsl:if test="$kol_vo &gt; 1">: Организация № <xsl:value-of select="position()"/>
							</xsl:if>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:UchrJuLIn">
			<xsl:variable name="kol_vo">
				<xsl:value-of select="count(feul_req:UchrJuLIn)"/>
			</xsl:variable>
			<xsl:for-each select="feul_req:UchrJuLIn">
				<br/>
				<table class="bordered w190">
					<tr class="title" bgcolor="silver">
						<td class="annot graphMain">
							<xsl:text>Сведения об учредителе (участнике) - иностранном юридическом лице</xsl:text>
							<xsl:if test="$kol_vo &gt; 1">: Организация № <xsl:value-of select="position()"/>
							</xsl:if>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:UchrFL">
			<xsl:variable name="kol_vo">
				<xsl:value-of select="count(feul_req:UchrFL)"/>
			</xsl:variable>
			<xsl:for-each select="feul_req:UchrFL">
				<br/>
				<table class="bordered w190">
					<tr class="title" bgcolor="silver">
						<td class="annot graphMain">
							<xsl:text>Сведения об учредителе (участнике) - физическом лице</xsl:text>
							<xsl:if test="$kol_vo &gt; 1">: Организация № <xsl:value-of select="position()"/>
							</xsl:if>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:UchrRFSubMO">
			<xsl:variable name="kol_vo">
				<xsl:value-of select="count(feul_req:UchrRFSubMO)"/>
			</xsl:variable>
			<xsl:for-each select="feul_req:UchrRFSubMO">
				<br/>
				<table class="bordered w190">
					<tr class="title" bgcolor="silver">
						<td class="annot graphMain">
							<xsl:text>Сведения об учредителе (участнике) - Российской Федерации, субъекте Российской Федерации, муниципальном образовании</xsl:text>
							<xsl:if test="$kol_vo &gt; 1">: Организация № <xsl:value-of select="position()"/>
							</xsl:if>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:UchrPIF">
			<xsl:variable name="kol_vo">
				<xsl:value-of select="count(feul_req:UchrPIF)"/>
			</xsl:variable>
			<xsl:for-each select="feul_req:UchrPIF">
				<br/>
				<table class="bordered w190">
					<tr class="title" bgcolor="silver">
						<td class="annot graphMain">
							<xsl:text>Сведения о паевом инвестиционном фонде, в состав имущества которого включена доля в уставном капитале</xsl:text>
							<xsl:if test="$kol_vo &gt; 1">: Организация № <xsl:value-of select="position()"/>
							</xsl:if>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvUprOrgsType -->
	<xsl:template match="feul_req:SvJuL_SvUprOrgs">
		<xsl:if test="feul_req:NaimINNUL">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td>Сведения о наименовании и (при наличии) ОГРН и ИНН ЮЛ - управляющей организации</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:NaimINNUL"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRegIn">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td>Сведения о регистрации в стране происхождения</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvRegIn"/>
		</xsl:if>
		<xsl:if test="feul_req:SvPredUL">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td>Сведения о наименовании представительства или филиала в Российской Федерации, через которое иностранное ЮЛ осуществляет полномочия управляющей организации</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvPredUL"/>
		</xsl:if>
		<xsl:if test="feul_req:SvAdrRF">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td>Сведения об адресе управляющей организации в Российской Федерации</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvAdrRF"/>
		</xsl:if>
		<xsl:if test="feul_req:SvNomTel">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td>Сведения о контактном телефоне</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvNomTel"/>
		</xsl:if>
		<xsl:if test="feul_req:PredInUL">
			<br/>
			<table class="w190">
				<tr class="title" bgcolor="#e3e3e3">
					<td>Сведения о лице, через которое иностранное юридическое лицо осуществляет полномочия управляющей организации</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:PredInUL"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись сведений о данном лице</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataPerv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvUstKapType -->
	<xsl:template match="feul_req:SvJuL_SvUstKap">
		<xsl:if test="feul_req:NaimVidKap">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование вида капитала</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimVidKap"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:SumKap">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Размер в рублях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(feul_req:SumKap, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:RubFraction">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Доля рубля в капитале</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:RubFraction"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:SvedUmUK">
			<div class="title marg-top">Сведения о нахождении хозяйственного общества в процессе уменьшения уставного капитала</div>
			<xsl:apply-templates select="feul_req:SvedUmUK"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvZapEGRULType -->
	<xsl:template match="feul_req:SvJuL_SvZapEGRUL">
		<table class="w190">
			<xsl:if test="feul_req:IdZap">
				<tr>
					<td class="annot graphMain" style="width:50%">Системный идентификатор записи</td>
					<td class="graphMain value" style="width:50%">
						<xsl:value-of select="feul_req:IdZap"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:GRN">
				<tr>
					<td class="annot graphMain" style="width:50%">Государственный регистрационный номер записи</td>
					<td class="graphMain value" style="width:50%">
						<xsl:value-of select="feul_req:GRN"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:DataZap">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата внесения записи в ЕГРЮЛ</td>
					<td class="graphMain value" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataZap"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<!--xsl:if test="feul_req:KodSPVZ">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида записи (причины внесения записи в ЕГРЮЛ) по справочнику СПВЗ</td>
					<td class="graphMain value" style="width:50%">
						<xsl:value-of select="feul_req:KodSPVZ"/>
					</td>
				</tr>
			</xsl:if-->
			<!--xsl:if test="feul_req:KodNO">
				<tr>
					<td class="annot graphMain" style="width:50%">Код органа по справочнику СОНО</td>
					<td class="graphMain value" style="width:50%">
						<xsl:value-of select="feul_req:KodNO"/>
					</td>
				</tr>
			</xsl:if-->
			<xsl:if test="feul_req:NaimNO">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование регистрирующего (налогового) органа</td>
					<td class="graphMain value" style="width:50%">
						<xsl:value-of select="feul_req:NaimNO"/>
					</td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="feul_req:SvZaFL">
			<table class="w190">
				<tr class="title">
					<td class="annot graphMain" bgcolor="#e3e3e3" colspan="2">Сведения о заявителе</td>
				</tr>
				<xsl:for-each select="feul_req:SvZaFL">
					<tr class="title">
						<td class="annot graphMain" colspan="2">Наименование заявителя по справочнику СЗОЮЛ: 
			<xsl:if test="feul_req:VidZav">
								<xsl:apply-templates select="feul_req:VidZav"/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain" style="width:5%"/>
						<td class="annot graphMain" style="width:95%">
							<xsl:apply-templates select="."/>
							<br/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<!--xsl:if test="feul_req:SvedPredDoc">
			<table class="w190">
				<tr class="title">
					<td class="annot graphMain" bgcolor="#e3e3e3">Сведения о документах, представленных при внесении записи в ЕГРЮЛ</td>
				</tr>
			</table>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
					</tr>
					<xsl:for-each select="feul_req:SvedPredDoc">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:SvSvid">
			<table class="w190">
				<tr class="title">
					<td class="annot graphMain" bgcolor="#e3e3e3">Сведения о свидетельстве, подтверждающем факт внесения записи в ЕГРЮЛ</td>
				</tr>
			</table>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Серия бланка свидетельства</td>
						<td class="graphMain bordered">Номер бланка свидетельства</td>
						<td class="graphMain bordered">Дата выдачи свидетельства</td>
						<td class="graphMain bordered">Запись, содержащей сведения о признании свидетельства недействительным по решению суда</td>
					</tr>
					<xsl:for-each select="feul_req:SvSvid">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if-->
		<xsl:if test="feul_req:SvStatusZap">
			<table class="w190">
				<tr class="title">
					<td class="annot graphMain" bgcolor="#e3e3e3">Сведения о статусе записи</td>
				</tr>
				<tr>
					<td class="annot graphMain" style="width:100%">
						<xsl:apply-templates select="feul_req:SvStatusZap"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvNaimPodrazdType -->
	<xsl:template match="feul_req:SvNaim">
		<xsl:if test="feul_req:NaimPoln">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Числитель</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="feul_req:NaimPoln">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData"/>
		<xsl:if test="feul_req:GrnData">
			<div class="title marg-top">Запись, содержащей указанные сведения</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnData"/>
		<xsl:if test="feul_req:GrnDataIspr"/>
		<xsl:if test="feul_req:GrnDataIspr">
			<div class="title marg-top">Запись об исправлении технической ошибки в указанных сведениях</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnDataIspr"/>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvNaimPIFType -->
	<xsl:template match="feul_req:SvNaimPIF">
		<xsl:if test="feul_req:NaimPIF">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Название (индивидуальное обозначение) паевого инвестиционного фонда</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="feul_req:NaimPIF">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvNomTelType -->
	<xsl:template match="feul_req:SvNomTel">
		<xsl:if test="feul_req:NomTel">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Контактный телефон</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NomTel"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvNotUdDogZalType -->
	<xsl:template match="feul_req:SvNotUdDogZal">
		<xsl:if test="feul_req:SvNotary">
			<div class="title marg-top">ФИО и (при наличии) ИНН нотариуса, удостоверившего договор залога</div>
			<xsl:apply-templates select="feul_req:SvNotary"/>
		</xsl:if>
		<xsl:if test="feul_req:Nomer">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер договора залога</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:Nomer"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:Data">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата договора залога</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:Data"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvObremType -->
	<xsl:template match="feul_req:SvObrem">
		<xsl:if test="feul_req:VidObrem">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид обременения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:VidObrem"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:SrokObrem">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Срок обременения или порядок определения срока</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="feul_req:SrokObrem">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:ReshSud">
			<div class="title marg-top">Сведения о решении судебного органа, по которому на долю учредителя (участника) наложено обременение</div>
			<xsl:apply-templates select="feul_req:ReshSud"/>
		</xsl:if>
		<xsl:if test="feul_req:SvZalogFL">
			<div class="title marg-top">Сведения о залогодержателе - ФЛ</div>
			<xsl:apply-templates select="feul_req:SvZalogFL"/>
		</xsl:if>
		<xsl:if test="feul_req:SvZalogUL">
			<div class="title marg-top">Сведения о залогодержателе - ЮЛ</div>
			<xsl:apply-templates select="feul_req:SvZalogUL"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvOKVEDOsnType -->
	<xsl:template match="feul_req:SvOKVEDDop|feul_req:SvOKVEDOsn">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:KodOKVED"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:NaimOKVED"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:PrVersOKVED"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="feul_req:GrnDataIspr">
					<xsl:text>Запись об исправлении технической ошибки в указанных сведениях: </xsl:text>
					<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					<br/>
				</xsl:if>
				<xsl:if test="feul_req:GrnDataPerv">
					<xsl:text>сведения о данном лице: </xsl:text>
					<xsl:apply-templates select="feul_req:GrnDataPerv"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvOrgOsushhPrType -->
	<xsl:template match="feul_req:SvOrgOsushhPr">
		<xsl:if test="feul_req:NaimINNUL">
			<div class="title marg-top">Сведения о наименовании и (при наличии) ОГРН и ИНН ЮЛ</div>
			<xsl:apply-templates select="feul_req:NaimINNUL"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись сведений о данном лице</b>
					</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataPerv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvPredULType -->
	<xsl:template match="feul_req:SvPredUL">
		<xsl:if test="feul_req:NaimPredUL">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Полное наименование представительства или филиала в Российской Федерации, через которое иностранное ЮЛ осуществляет полномочия управляющей организации</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="feul_req:NaimPredUL">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvPriostLicType -->
	<xsl:template match="feul_req:SvPriostLic">
		<xsl:if test="feul_req:DataPriostLic">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата приостановления действия лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataPriostLic"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:LicOrgPriostLic">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование лицензирующего органа, приостановившего действие лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:LicOrgPriostLic"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvRegInEGRULType -->
	<xsl:template match="feul_req:SvRegIn">
		<xsl:if test="feul_req:OKSM">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны происхождения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:OKSM"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimStran">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование страны происхождения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimStran"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataReg">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataReg"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:RegNomer">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:RegNomer"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimRegOrg">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование регистрирующего органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimRegOrg"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:AdrStr">
			<div class="title marg-top">Адрес (место нахождения) в стране происхождения</div>
			<xsl:apply-templates select="feul_req:AdrStr"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись, содержащей указанные сведения</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись об исправлении технической ошибки в указанных сведениях</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvRegOldType -->
	<xsl:template match="feul_req:SvRegOld">
		<xsl:if test="feul_req:RegNom">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер, присвоенный юридическому лицу до 1 июля 2002 года</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:RegNom"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataReg">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации юридического лица до 1 июля 2002 года</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataReg"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimRo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование органа, зарегистрировавшего юридическое лицо до 1 июля 2002 года</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimRo"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvReorgUlType -->
	<xsl:template match="feul_req:SvReorgUl">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:OGRN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:Inn"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:NaimUlPoln"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:SostUl"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="feul_req:GrnData">
					<xsl:apply-templates select="feul_req:GrnData"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="feul_req:GrnDataIspr">
					<xsl:apply-templates select="feul_req:GrnDataIspr"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvRojdEGRULType -->
	<xsl:template match="feul_req:SvRojd|feul_req:SvRojdFL">
		<xsl:if test="feul_req:DataRojd">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата рождения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataRojd"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:MestoRojd">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Место рождения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:MestoRojd"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:PrDataRojd">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак полноты представляемой даты рождения физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="feul_req:PrDataRojd = '1'">только год (сведения о месяце и дне в указанном месяце отсутствуют)</xsl:when>
							<xsl:when test="feul_req:PrDataRojd = '2'">только месяц и код (сведения о дне в указанном месяце отсутствуют)</xsl:when>
							<xsl:when test="feul_req:PrDataRojd = '3'">полная дата</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="translate(feul_req:PrDataRojd, '.', ',')"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvStatusZapType -->
	<xsl:template match="feul_req:SvStatusZap">
		<xsl:if test="feul_req:GrnDataNed">
			<div class="title marg-top">ГРН и дата внесения записи, которой запись признана недействительной</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnDataNed"/>
		<xsl:if test="feul_req:GrnDataIspr">
			<div class="title marg-top">ГРН и дата записи, которой внесены исправления в связи с технической ошибкой</div>
			<xsl:for-each select="feul_req:GrnDataIspr">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvSvidType -->
	<xsl:template match="feul_req:SvSvid">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:Seria"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="feul_req:Number"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="feul_req:DataVidSvid"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="feul_req:GrnInfo">
					<xsl:apply-templates select="feul_req:GrnInfo"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvUchetNoFilialType -->
	<xsl:template match="feul_req:SvUchetNoFilial">
		<xsl:if test="feul_req:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП филиала/представительства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KPP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:DataPostUch">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата постановки на учет в налоговом органе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="feul_req:DataPostUch"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="feul_req:KodNo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код органа по справочнику СОНО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:KodNo"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
		<xsl:if test="feul_req:NaimNo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование налогового органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimNo"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<div class="title marg-top">Запись, содержащей указанные сведения</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnData"/>
		<xsl:if test="feul_req:GrnDataIspr">
			<div class="title marg-top">Запись об исправлении технической ошибки в указанных сведениях</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnDataIspr"/>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvUlType -->
	<xsl:template match="feul_req:SvUl |feul_req:SvUprOrg">
		<xsl:if test="feul_req:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Основной государственный регистрационный номер ЮЛ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimPoln">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Полное наименование юридического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="feul_req:NaimPoln">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvUlOrgType -->
	<xsl:template match="feul_req:SvUlOrg|feul_req:SvUlForeignOrg">
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="name(.)= 'feul_req:SvUlForeignOrg'">
			<xsl:if test="feul_req:StrKod">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">Код страны регистрации (инкорпорации) по справочнику ОКСМ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="feul_req:StrKod"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="feul_req:RegPlace">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">Место нахождения  иностранного юридического лица в стране регистрации (инкорпорации)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="feul_req:RegPlace"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись, содержащей указанные сведения</b>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvUlSlojnReorgType -->
	<xsl:template match="feul_req:SvUlSlojnReorg">
		<xsl:if test="feul_req:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Основной государственный регистрационный номер юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:NaimULPoln">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Полное наименование юридического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="feul_req:NaimULPoln">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvUpOrgPIFType -->
	<xsl:template match="feul_req:SvUpOrgPIF">
		<xsl:if test="feul_req:UprOrgPif"/>
		<xsl:if test="feul_req:UprOrgPif">
			<div class="title marg-top">Наименование и (при наличии) ОГРН и ИНН управляющей компании паевого инвестиционного фонда</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:UprOrgPif"/>
		<xsl:if test="feul_req:GrnDataPerv"/>
		<xsl:if test="feul_req:GrnDataPerv">
			<div class="title marg-top">Запись сведений о данном лице</div>
		</xsl:if>
		<xsl:apply-templates select="feul_req:GrnDataPerv"/>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvZaFLType -->
	<xsl:template match="feul_req:SvZaFL">
		<xsl:if test="feul_req:SvUl">
			<div class="title marg-top">
				<u>Сведения о юридическом лице, от имени которого действует заявитель</u>
			</div>
			<xsl:apply-templates select="feul_req:SvUl"/>
		</xsl:if>
		<xsl:if test="feul_req:SvUprOrg">
			<div class="title marg-top">
				<u>Сведения об управляющей компании</u>
			</div>
			<xsl:apply-templates select="feul_req:SvUprOrg"/>
		</xsl:if>
		<xsl:if test="feul_req:SvFl">
			<div class="title marg-top">
				<u>Сведения о ФЛ - заявителе</u>
			</div>
			<xsl:apply-templates select="feul_req:SvFl"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvZalogFLType -->
	<xsl:template match="feul_req:SvZalogFL">
		<xsl:if test="feul_req:SvFL">
			<div class="title marg-top">Сведения о ФИО и (при наличии) ИНН ФЛ</div>
			<xsl:apply-templates select="feul_req:SvFL"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRojdFL">
			<div class="title marg-top">Сведения о рождении ФЛ</div>
			<xsl:apply-templates select="feul_req:SvRojdFL"/>
		</xsl:if>
		<xsl:if test="feul_req:UdLichnFL">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность</div>
			<xsl:apply-templates select="feul_req:UdLichnFL"/>
		</xsl:if>
		<xsl:if test="feul_req:AdresMZhRF">
			<div class="title marg-top">Сведения об адресе места жительства в Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdresMZhRF"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMZhIn">
			<div class="title marg-top">Сведения об адресе места жительства за пределами территории Российской Федерации</div>
			<xsl:apply-templates select="feul_req:AdrMZhIn"/>
		</xsl:if>
		<xsl:if test="feul_req:SvNotUdDogZal">
			<div class="title marg-top">Сведения о нотариальном удостоверении договора залога</div>
			<xsl:apply-templates select="feul_req:SvNotUdDogZal"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<b>Запись сведений о данном лице</b>
					</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataPerv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:SvZalogULType -->
	<xsl:template match="feul_req:SvZalogUL">
		<xsl:if test="feul_req:NaimINNUL">
			<div class="title marg-top">Сведения о наименовании и (при наличии) ОГРН и ИНН ЮЛ</div>
			<xsl:apply-templates select="feul_req:NaimINNUL"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRegIn">
			<div class="title marg-top">Сведения о регистрации в стране происхождения</div>
			<xsl:apply-templates select="feul_req:SvRegIn"/>
		</xsl:if>
		<xsl:if test="feul_req:SvNotUdDogZal">
			<div class="title marg-top">Сведения о нотариальном удостоверении договора залога</div>
			<xsl:apply-templates select="feul_req:SvNotUdDogZal"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<div class="title marg-top">Запись сведений о данном лице</div>
			<xsl:apply-templates select="feul_req:GrnDataPerv"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:UchrFLType -->
	<xsl:template match="feul_req:UchrFL">
		<xsl:if test="feul_req:SvFl">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о ФИО и (при наличии) ИНН ФЛ</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvFl"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRojdFL">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о рождении ФЛ</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvRojdFL"/>
		</xsl:if>
		<xsl:if test="feul_req:UdLichnFL">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о документе, удостоверяющем личность</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:UdLichnFL"/>
		</xsl:if>
		<xsl:if test="feul_req:AdresMZhRF">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения об адресе места жительства в Российской Федерации</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:AdresMZhRF"/>
		</xsl:if>
		<xsl:if test="feul_req:AdrMZhIn">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения об адресе места жительства за пределами территории Российской Федерации</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:AdrMZhIn"/>
		</xsl:if>
		<xsl:if test="feul_req:DoljaUstKap">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о доле учредителя (участника)</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:DoljaUstKap"/>
		</xsl:if>
		<xsl:if test="feul_req:SvObrem">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения об обременении доли участника</td>
				</tr>
			</table>
			<xsl:for-each select="feul_req:SvObrem">
				<div class="title marg-top">№ <xsl:value-of select="position()"/>
				</div>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:SvDovUprUL">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о доверительном управляющем - ЮЛ</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvDovUprUL"/>
		</xsl:if>
		<xsl:if test="feul_req:SvDovUprFL">
			<br/><br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о доверительном управляющем - ФЛ</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvDovUprFL"/>
		</xsl:if>
		<xsl:if test="feul_req:LicoUprNasl">
			<br/><br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о лице, осуществляющем управление долей, переходящей в порядке наследования</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:LicoUprNasl"/>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Запись сведений о данном лице</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:GrnDataPerv"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:UchrJuLRosType -->
	<xsl:template match="feul_req:UchrJuLRos|feul_req:UchrJuLIn">
		<xsl:if test="feul_req:NaimINNUL">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">
						<xsl:choose>
							<xsl:when test="name(.) = 'feul_req:UchrJuLRos'">Сведения о наименовании и (при наличии) ОГРН и ИНН ЮЛ</xsl:when>
							<xsl:when test="name(.) = 'feul_req:UchrJuLIn'">Сведения о наименовании и (при наличии) ИНН ЮЛ</xsl:when>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:NaimINNUL"/>
		</xsl:if>
		<xsl:if test="feul_req:SvRegOld">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">
						<xsl:choose>
							<xsl:when test="name(.) = 'feul_req:UchrJuLRos'">Сведения о регистрации учредителя (участника) до 01.07.2002 г</xsl:when>
							<xsl:when test="name(.) = 'feul_req:UchrJuLIn'">Сведения о регистрации в стране происхождения</xsl:when>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:choose>
				<xsl:when test="name(.) = 'feul_req:UchrJuLRos'">
					<xsl:apply-templates select="feul_req:SvRegOld"/>
				</xsl:when>
				<xsl:when test="name(.) = 'feul_req:UchrJuLIn'">
					<xsl:apply-templates select="feul_req:SvRegIn"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="feul_req:DoljaUstKap">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения о доле учредителя (участника)</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:DoljaUstKap"/>
		</xsl:if>
		<xsl:if test="feul_req:SvObrem">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Сведения об обременении доли участника</td>
				</tr>
			</table>
			<xsl:for-each select="feul_req:SvObrem">
				<div class="title marg-top">№ <xsl:value-of select="position()"/>
				</div>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain">Запись сведений о данном лице</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:GrnDataPerv"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
	<xsl:template match="feul_req:UchrOrganization">
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
	</xsl:template>
	<!-- Шаблон для типа feul_req:UchrPIFType -->
	<xsl:template match="feul_req:UchrPIF">
		<xsl:if test="feul_req:SvNaimPIF">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о названии (индивидуальном обозначении) паевого инвестиционного фонда</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvNaimPIF"/>
		</xsl:if>
		<xsl:if test="feul_req:SvUpOrgPIF">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения об управляющей компании паевого инвестиционного фонда</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:SvUpOrgPIF"/>
		</xsl:if>
		<xsl:if test="feul_req:DoljaUstKap">
			<br/><br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о доле учредителя (участника)</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:DoljaUstKap"/>
		</xsl:if>
		<xsl:if test="feul_req:SvObrem">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения об обременении доли участника</td>
				</tr>
			</table>
			<xsl:for-each select="feul_req:SvObrem">
				<div class="title marg-top">№ <xsl:value-of select="position()"/>
				</div>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Запись сведений о данном лице</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:GrnDataPerv"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:UchrRFSubMOType -->
	<xsl:template match="feul_req:UchrRFSubMO">
		<!--tr class="title">
						<td class="graphMain bordered">Сведения об органе государственной власти, органе местного самоуправления или о юридическом лице, осуществляющем права учредителя (участника)</td>
						<td class="graphMain bordered">Сведения о физическом лице, осуществляющем права учредителя (участника)</td>
						<td class="graphMain bordered">Сведения об обременении доли участника</td>
					</tr-->
		<table>
			<xsl:if test="feul_req:KodUrchRFSubMo">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида учредителя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="feul_req:KodUrchRFSubMo='1'">
								<xsl:text>(1) Российская Федерация</xsl:text>
							</xsl:when>
							<xsl:when test="feul_req:KodUrchRFSubMo='2'">
								<xsl:text>(2) Субъект Российской организации</xsl:text>
							</xsl:when>
							<xsl:when test="feul_req:KodUrchRFSubMo='3'">
								<xsl:text>(3) Муниципальное образование</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="feul_req:KodUrchRFSubMo"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:NaimMo">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование муниципального образования</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:NaimMo"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:RegionKod">
				<tr>
					<td class="annot graphMain" style="width:50%">Код субъекта Российской Федерации, который является учредителем (участником)
                        юридического лица или на территории которого находится муниципальное образование, которое является
                        учредителем (участником) юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:RegionKod"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="feul_req:RegionName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование субъекта Российской Федерации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="feul_req:RegionName"/>
					</td>
				</tr>
			</xsl:if>
			<br/>
		</table>
		<xsl:if test="feul_req:DoljaUstKap">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения о доле учредителя (участника)</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:DoljaUstKap"/>
		</xsl:if>
		<xsl:if test="feul_req:SvOrgOsushhPr">
			<xsl:variable name="kol_vo">
				<xsl:value-of select="count(feul_req:SvOrgOsushhPr)"/>
			</xsl:variable>
			<xsl:for-each select="feul_req:SvOrgOsushhPr">
				<br/>
				<table>
					<tr class="title" bgcolor="#e3e3e3">
						<td class="annot graphMain">
							<xsl:text>Сведения об органе государственной власти, органе местного самоуправления или о юридическом лице, осуществляющем права учредителя (участника)</xsl:text>
							<xsl:if test="$kol_vo &gt; 1">
								<xsl:text>: Организация № </xsl:text>
								<xsl:value-of select="position()"/>
							</xsl:if>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:SvFLOsushhPr">
			<xsl:variable name="kol_vo">
				<xsl:value-of select="count(feul_req:SvFLOsushhPr)"/>
			</xsl:variable>
			<xsl:for-each select="feul_req:SvFLOsushhPr">
				<br/>
				<table>
					<tr class="title" bgcolor="#e3e3e3">
						<td class="annot graphMain">
							<xsl:text>Сведения о физическом лице, осуществляющем права учредителя (участника)</xsl:text>
							<xsl:if test="$kol_vo &gt; 1">
								<xsl:text>: Организация № </xsl:text>
								<xsl:value-of select="position()"/>
							</xsl:if>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:SvObrem">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Сведения об обременении доли участника</td>
				</tr>
			</table>
			<xsl:for-each select="feul_req:SvObrem">
				<div class="title marg-top">№ <xsl:value-of select="position()"/>
				</div>
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataPerv">
			<br/>
			<table>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="annot graphMain" style="width:50%">Запись сведений о данном лице</td>
				</tr>
			</table>
			<xsl:apply-templates select="feul_req:GrnDataPerv"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:UdLichnEGRULType -->
	<xsl:template match="feul_req:UdLichnFL|feul_req:UdLichFL">
		<xsl:if test="cat_ru:IdentityCardCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование вида документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:IssuerCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти, выдавшую документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AuthorityId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись, содержащей указанные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="feul_req:GrnDataIspr">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Запись об исправлении технической ошибки в указанных сведениях</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="feul_req:GrnDataIspr"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа feul_req:VidZavType -->
	<xsl:template match="feul_req:VidZav">
		<xsl:if test="feul_req:KodSZOUL">
			<xsl:text>(код: </xsl:text>
			<xsl:value-of select="feul_req:KodSZOUL"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="feul_req:NameSZOUL">
			<xsl:value-of select="feul_req:NameSZOUL"/>
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
