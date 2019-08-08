<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gtsh="urn:customs.ru:Information:CustomsDocuments:GoodsTranshipment:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
		<xsl:param name="dategtd"/>
		<xsl:choose>
			<xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
				<xsl:value-of select="substring($dategtd,9,2)"/>
				<xsl:value-of select="substring($dategtd,6,2)"/>
				<xsl:value-of select="substring($dategtd,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dategtd"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="gtsh:GoodsTranshipment">
		<html>
			<head>
				<title>Заявление (уведомление) на совершение грузовых операций и (или) замены транспортных средств / Уведомление об обстоятельствах, препятствующих исполнению обязанностей перевозчика</title>
				<!--xsl:choose>
               <xsl:when test="gtsh:DocumentDirection ='1'">
                  <title>Уведомление о проведении грузовых операций</title>
               </xsl:when>
               <xsl:otherwise>
                  <title>Заявление о необходимости проведения грузовых операций</title>
               </xsl:otherwise>
            </xsl:choose-->
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					body {
					background: #cccccc;
					}
		
					div
					{
					white-space: normal;
					}

					div.page {
					width: 180mm;
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
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}
		
					table.border tr td
					{
					border: 1px solid windowtext;
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
                    
					.border_bottom
					{
					border-bottom: 1px solid black;
					}
		
					.graphMain
					{
					font-family: Arial;
					font-size: 11pt;
					}
		
					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					}
			
					.graphDelim 
					{
					font-family: Arial;
					font-size: 4pt;
					}
		
					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:top;
					}
		
					.graphHeader
					{
					font-family: Arial;
					font-size: 12pt;
					font-weight:bold;
					}
					
					th
					{
					font-family: Arial;
					font-size: 10pt;
					font-weight:bold;
					text-align:center;
					border: solid 1px windowtext;
					}
		
					td.graphHeader
					{
					vertical-align:top;
					}
					td.value.graphHeader
					{
					vertical-align:bottom;
					}
		
					.normal
					{
					font-size: 11pt;
					font-family:Arial;
					}			
		
					.bold
					{
					font-weight: bold;
					font-family:Arial;
					font-size: 11pt;
					}			
		
					.italic
					{
					font-style: italic;
					font-family:Arial;
					font-size: 10pt;
					}			
			
					.delim {
						height: 7pt;
					}
		
					.delim_3 {
						height: 3pt;
					}
                    
                   </style>
			</head>
			<body>
				<div class="page">
					<h1 align="center" style="font: 15pt; font-weight:bold">
						<xsl:choose>
							<xsl:when test="gtsh:DocType='0'">Заявление на получение разрешения на совершение грузовых операций и (или) замены транспортных средств</xsl:when>
							<xsl:when test="gtsh:DocType='1'">Уведомление о совершение грузовых операций и (или) замены транспортных средств</xsl:when>
							<xsl:when test="gtsh:DocType='2'">Уведомление об обстоятельствах, препятствующих исполнению обязанностей перевозчика</xsl:when>
						</xsl:choose>
					</h1>
					<xsl:if test="gtsh:RegistrationNumber">
						<table>
							<tbody>
								<tr>
									<td class="graphMargin" width="28%" align="right">№</td>
									<td class="graphMargin" width="2%"/>
									<td class="graphMargin value" align="center" width="40%">
										<xsl:apply-templates mode="GTD_num" select="gtsh:RegistrationNumber"/>
									</td>
									<td class="graphMargin" width="30%"/>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<br/>
					<xsl:if test="gtsh:DocDate or gtsh:DocTime">
						<table>
							<tbody>
								<tr>
									<td class="graphMargin" width="71%" align="right">Дата и время направления документа:</td>
									<td class="graphMargin" width="2%"/>
									<td class="graphMargin value" width="2%"/>
									<td class="graphMargin value" width="25%">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="gtsh:DocDate"/>
										</xsl:call-template>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(gtsh:DocTime,1,5)"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<xsl:if test="gtsh:CustomsReg or gtsh:ChiefReg or gtsh:CustomsPersonReg">
						<span class="bold">
							<xsl:choose>
								<xsl:when test="gtsh:DocType='0'">Сведения о регистрации Заявления</xsl:when>
								<xsl:otherwise>Сведения о регистрации Уведомления</xsl:otherwise>
							</xsl:choose>
						</span>
						<table style="margin-top:0;">
							<tbody>
								<xsl:if test="gtsh:CustomsReg">
									<tr>
										<td class="graphMargin" valign="bottom" width="40%">Таможенный орган</td>
										<td align="center" class="graphMargin value" valign="bottom">
											<xsl:value-of select="gtsh:CustomsReg/cat_ru:OfficeName"/>
											<xsl:if test="gtsh:CustomsReg/cat_ru:OfficeName">
												<xsl:text> (</xsl:text>
											</xsl:if>
											<xsl:value-of select="gtsh:CustomsReg/cat_ru:Code"/>
											<xsl:if test="gtsh:CustomsReg/cat_ru:OfficeName">
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="gtsh:ChiefReg">
									<tr>
										<td class="graphMargin" valign="bottom" width="40%">Начальник (заместитель начальника) таможенного органа</td>
										<td align="center" class="graphMargin value" valign="bottom">
											<xsl:value-of select="gtsh:ChiefReg/cat_ru:PersonName"/>
											<xsl:if test="gtsh:ChiefReg/cat_ru:LNP">
												<xsl:text> (</xsl:text>
												<xsl:value-of select="gtsh:ChiefReg/cat_ru:LNP"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="gtsh:CustomsPersonReg">
									<tr>
										<td class="graphMargin" valign="bottom" width="40%">Должностное лицо таможенного органа</td>
										<td align="center" class="graphMargin value" valign="bottom">
											<xsl:value-of select="gtsh:CustomsPersonReg/cat_ru:PersonName"/>
											<xsl:if test="gtsh:CustomsPersonReg/cat_ru:LNP">
												<xsl:text> (</xsl:text>
												<xsl:value-of select="gtsh:CustomsPersonReg/cat_ru:LNP"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<xsl:for-each select="gtsh:TransportDoc">
						<table>
							<tbody>
								<xsl:if test="gtsh:TD">
									<tr>
										<td class="bold" width="40%" valign="bottom">Рег. № транзитной декларации:</td>
										<td class="graphMargin value" width="60%">
											<xsl:apply-templates mode="GTD_num" select="gtsh:TD"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="gtsh:MDPNumber">
									<tr>
										<td class="bold" width="40%" valign="bottom">Номер книжки МДП:</td>
										<td class="graphMargin value" width="60%">
											<span class="italic">серия </span>
											<xsl:value-of select="gtsh:MDPNumber/gtsh:TIRSeries"/>
											<span class="italic"> № </span>
											<xsl:value-of select="gtsh:MDPNumber/gtsh:TIRID"/>
											<xsl:if test="gtsh:MDPNumber/gtsh:TIRPageNumber">
												<span class="italic"> № листа </span>
												<xsl:text/>
												<xsl:value-of select="gtsh:MDPNumber/gtsh:TIRPageNumber"/>
											</xsl:if>
											<xsl:if test="gtsh:MDPNumber/gtsh:RegistrationDate">
												<span class="italic"> дата рег.  </span>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="gtsh:MDPNumber/gtsh:RegistrationDate"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="gtsh:CarnetNumber">
									<tr>
										<td class="bold" width="40%" valign="bottom">Номер карнета АТА:</td>
										<td class="graphMargin value" width="60%">
											<xsl:apply-templates select="gtsh:CarnetNumber"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="bold">
									<xsl:choose>
										<xsl:when test="gtsh:DocType='0'">Сведения о лице, направившем Заявление:</xsl:when>
										<xsl:otherwise>Сведения о лице, направившем Уведомление:</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
							<tr>
								<td class="graphMargin value" align="left">
									<xsl:apply-templates mode="org" select="gtsh:Applicant"/>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="gtsh:Carrier or (gtsh:Carrier = '1' or gtsh:Carrier = 'true' or gtsh:Carrier = 't' or gtsh:Carrier = 'TRUE')">
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="bold" align="left">Сведения о лице, осуществляющем перевозку (транспортировку) товаров:</td>
								</tr>
								<tr>
									<td class="delim_3"> </td>
								</tr>
								<tr>
									<td class="graphMargin value" align="left">
										<xsl:choose>
											<xsl:when test="gtsh:Carrier = '1' or gtsh:Carrier = 'true' or gtsh:Carrier = 't' or gtsh:Carrier = 'TRUE'">
												<xsl:text>См. </xsl:text>
												<xsl:choose>
													<xsl:when test="gtsh:DocType='0'">cведения о лице, направившем Заявление</xsl:when>
													<xsl:otherwise>cведения о лице, направившем Уведомление</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates mode="org" select="gtsh:Carrier"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtsh:NextCarrier">
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="bold" align="left">Сведения о лице, которое будет перевозить (транспортировать) товары после осуществления перегрузки (перевалки) товаров:</td>
								</tr>
								<tr>
									<td class="delim_3"> </td>
								</tr>
								<tr>
									<td class="graphMargin value" align="left">
										<xsl:apply-templates mode="org" select="gtsh:NextCarrier"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtsh:IncidentInfo">
						<br/>
						<xsl:apply-templates select="gtsh:IncidentInfo"/>
						<br/>
					</xsl:if>
					<xsl:if test="gtsh:DetailsCargoOperation">
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="bold">Cведения о планируемых грузовых операциях и (или) замене транспортных средств с удалением наложенных таможенных пломб и печатей:</td>
								</tr>
								<tr>
									<td class="delim_3"> </td>
								</tr>
								<tr>
									<td class="graphMargin value" align="left">
										<xsl:apply-templates select="gtsh:DetailsCargoOperation"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtsh:DetailsCargoOperationIfIncident">
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="bold">Сведения о необходимости (об отсутствии необходимости) разгрузки, перегрузки (перевалки) или совершения иных грузовых операций с товарами, перевозимыми (транспортируемыми) в соответствии с таможенной процедурой таможенного транзита, в случае аварии:</td>
								</tr>
								<tr>
									<td class="delim_3"> </td>
								</tr>
								<tr>
									<td class="graphMargin value" align="left">
										<xsl:apply-templates select="gtsh:DetailsCargoOperationIfIncident"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtsh:ReloadPlace">
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="bold">Место проведения грузовых и иных операций:</td>
								</tr>
								<tr>
									<td class="delim_3"> </td>
								</tr>
								<tr>
									<td class="graphMargin value" align="left">
										<xsl:apply-templates select="gtsh:ReloadPlace"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtsh:Transport">
						<br/>
						<b>Сведения о новом составе транспортных средств после проведения грузовых операций: </b>
						<table class="graphMain border">
							<tbody>
								<tr>
									<th align="center">Код вида транспортного средства</th>
									<xsl:if test="//cat_ru:VIN">
										<th align="center">Номер шасси (VIN)</th>
									</xsl:if>
									<xsl:if test="//cat_ru:TransportKindCode">
										<th align="center">Код типа транспортного средства</th>
									</xsl:if>
									<xsl:if test="//cat_ru:TransportMarkCode">
										<th align="center">Код марки транспортного средства</th>
									</xsl:if>
									<xsl:if test="//cat_ru:TransportIdentifier">
										<th align="center">Идентификатор</th>
									</xsl:if>
									<xsl:if test="//cat_ru:TransportMeansNationalityCode">
										<th align="center">Код страны принадлежности</th>
									</xsl:if>
									<xsl:if test="//cat_ru:ActiveTransportIdentifier">
										<th align="center">Идентификатор активного транспортного средства для прицепов, полуприцепов и др.</th>
									</xsl:if>
									<xsl:if test="//cat_ru:TransportRegNumber">
										<th align="center">Номер свидетельства о регистрации транспортного средства для РБ</th>
									</xsl:if>
								</tr>
								<xsl:apply-templates select="gtsh:Transport"/>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtsh:Seal">
						<br/>
						<b>Информация о вновь наложенных пломбах, печатях и иных средствах идентификации: </b>
						<table class="graphMain border">
							<tbody>
								<tr>
									<th align="center">Номер</th>
									<th align="center">Вид</th>
									<xsl:if test="//gtsh:Identprevious">
										<th align="center">Признак снятия ранее наложенных средств идентификации</th>
									</xsl:if>
									<xsl:if test="//gtsh:IdentDesc">
										<th align="center">Примечание</th>
									</xsl:if>
									<xsl:if test="//gtsh:Quantity">
										<th align="center">Количество</th>
									</xsl:if>
								</tr>
								<xsl:apply-templates select="gtsh:Seal"/>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtsh:ProvidedDocuments">
						<br/>
						<b>Перечень документов, предоставленных вместе с обращением: </b>
						<table class="graphMain border">
							<tbody>
								<tr>
									<xsl:if test="//cat_ru:PrDocumentName">
										<th align="center">Наименование документа</th>
									</xsl:if>
									<xsl:if test="//cat_ru:PrDocumentNumber">
										<th align="center">Номер документа</th>
									</xsl:if>
									<xsl:if test="//cat_ru:PrDocumentDate">
										<th align="center">Дата документа</th>
									</xsl:if>
								</tr>
								<xsl:apply-templates select="gtsh:ProvidedDocuments"/>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<xsl:if test="gtsh:UIN">
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="bold" width="40%">УИН описи</td>
									<td class="graphMargin value" align="center" width="60%">
										<xsl:apply-templates mode="GTD_num" select="gtsh:UIN"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtsh:InformingWay">
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="bold" width="40%">Предпочтительный способ информирования о результатах рассмотрения 
										<xsl:choose>
											<xsl:when test="gtsh:DocType='0'"> Заявления:</xsl:when>
											<xsl:otherwise> Уведомления:</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="graphMargin value" align="center" width="60%">
										<xsl:for-each select="gtsh:InformingWay">
											<xsl:call-template name="CommunicationDetails"/>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="gtsh:ReloadPlace">
		<xsl:choose>
			<xsl:when test="cat_ru:OfficeName">
				<xsl:value-of select="cat_ru:OfficeName"/>  
				(<xsl:value-of select="cat_ru:Code"/>)
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="cat_ru:Code"/>
			</xsl:otherwise>
		</xsl:choose>
		<span class="graphMain">;</span>
		<xsl:if test="gtsh:BorderPointCode">
			<span class="italic"> Код пункта пропуска</span><span class="graphMain">: </span><xsl:value-of select="gtsh:BorderPointCode"/>; 
		</xsl:if>
		<xsl:if test="gtsh:TranshipmentKind">
			<span class="italic"> Вид грузовых операций</span><span class="graphMain">: </span>
			<xsl:choose>
				<xsl:when test="gtsh:TranshipmentKind='0'">разгрузка</xsl:when>
				<xsl:when test="gtsh:TranshipmentKind='1'">перегрузка</xsl:when>
				<xsl:when test="gtsh:TranshipmentKind='2'">замена ТС</xsl:when>
			</xsl:choose>
			<xsl:text>;</xsl:text>
		</xsl:if>
		<xsl:for-each select="gtsh:RWStation">
			<xsl:if test="gtsh:StationName">
				<span class="italic"> Название станции</span><span class="graphMain">: </span><xsl:value-of select="gtsh:StationName"/>;  
			</xsl:if>
			<span class="italic"> Код станции</span><span class="graphMain">: </span><xsl:value-of select="gtsh:StationCode"/>; 
			<xsl:if test="gtsh:RailwayCode">
				<span class="italic"> Код дороги</span><span class="graphMain">: </span><xsl:value-of select="gtsh:RailwayCode"/>;
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="gtsh:Address">
			<span class="italic">Адрес</span><span class="graphMain">: </span>
			<xsl:apply-templates mode="ru_address" select="gtsh:Address"/>
		</xsl:if>
   </xsl:template>
	<xsl:template match="gtsh:IncidentInfo">
		<span class="bold">Информация о происшествии:</span>
		<br/>
		<table style="margin-top:0;">
			<tbody>
				<xsl:if test="gtsh:IncidentDescription">
					<tr>
						<td class="graphMargin" valign="bottom" width="40%">Описание обстоятельства, препятствующего перевозке товаров</td>
						<td align="center" class="graphMargin value" valign="bottom">
							<xsl:value-of select="gtsh:IncidentDescription"/>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td class="graphMargin" valign="bottom" width="40%">Дата происшествия</td>
					<td align="center" class="graphMargin value" valign="bottom">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="gtsh:Date"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td class="graphMargin" valign="bottom" width="40%">Место происшествия</td>
					<td align="center" class="graphMargin value" valign="bottom">
						<xsl:apply-templates mode="ru_address" select="gtsh:AccidentPlace"/>
					</td>
				</tr>
				<xsl:if test="gtsh:CustomsPerson">
					<tr>
						<td class="graphMargin" valign="bottom" width="40%">Должностное лицо ТО, составившее акт об аварии</td>
						<td align="center" class="graphMargin value" valign="bottom">
							<xsl:value-of select="gtsh:CustomsPerson/cat_ru:PersonName"/>
							<xsl:if test="cat_ru:LNP">(ЛНП: <xsl:value-of select="gtsh:CustomsPerson/cat_ru:LNP"/>)</xsl:if>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="gtsh:DamageIndicators">
					<xsl:apply-templates select="gtsh:DamageIndicators"/>
				</xsl:if>
				<xsl:if test="gtsh:Measures">
					<tr>
						<td class="graphMargin" valign="bottom" width="40%">Меры, принятые для продолжения перевозки</td>
						<td align="center" class="graphMargin value" valign="bottom">
							<xsl:value-of select="gtsh:Measures"/>
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
		<br/>
		<xsl:if test="gtsh:LostGoodsInfo">
			<b>Информация об утрате (отсутствии/уничтожении) части товара: </b>
			<table class="graphMain border">
				<tbody>
					<tr>
						<th align="center">№ п/п по ТД/МДП</th>
						<xsl:if test="//gtsh:GoodsDescription">
							<th align="center">Наименование товара</th>
						</xsl:if>
						<xsl:if test="//gtsh:PackageKindSequence">
							<th align="center">№ п/п вида упаковки</th>
						</xsl:if>
						<xsl:if test="//gtsh:AbsenceKind">
							<th align="center">Вид утраты товара или его части</th>
						</xsl:if>
						<xsl:if test="//gtsh:GrossMass">
							<th align="center">Вес брутто утраченной части товара</th>
						</xsl:if>
						<xsl:if test="//gtsh:LostPackages">
							<th align="center">Сведения об упаковках</th>
						</xsl:if>
						<xsl:if test="//gtsh:LostGoodsQuantity">
							<th align="center">Количество</th>
						</xsl:if>
					</tr>
					<xsl:apply-templates select="gtsh:LostGoodsInfo"/>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gtsh:LostGoodsInfo">
		<tr>
			<td>
				<xsl:value-of select="gtsh:GoodsNumber"/>
			</td>
			<xsl:if test="//gtsh:GoodsDescription">
				<td>
					<xsl:for-each select="gtsh:GoodsDescription">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
			</xsl:if>
			<xsl:if test="//gtsh:PackageKindSequence">
				<td>
					<xsl:value-of select="gtsh:PackageKindSequence"/>
				</td>
			</xsl:if>
			<xsl:if test="//gtsh:AbsenceKind">
				<td>
					<xsl:choose>
						<xsl:when test="gtsh:AbsenceKind = '1'">Утерян</xsl:when>
						<xsl:when test="gtsh:AbsenceKind = '2'">Уничтожен</xsl:when>
						<xsl:when test="gtsh:AbsenceKind = '3'">Частично утерян, частично уничтожен</xsl:when>
					</xsl:choose>
				</td>
			</xsl:if>
			<xsl:if test="//gtsh:GrossMass">
				<td>
					<xsl:value-of select="gtsh:GrossMass"/>
				</td>
			</xsl:if>
			<xsl:if test="//gtsh:LostPackages">
				<td>
					<xsl:if test="gtsh:LostPackages">
						<xsl:apply-templates select="gtsh:LostPackages"/>
					</xsl:if>	
				</td>
				<td>
					<xsl:if test="gtsh:LostPackages/catESAD_cu:PalleteQuantity">
						<xsl:value-of select="gtsh:LostPackages/catESAD_cu:PalleteQuantity"/>
					</xsl:if>	
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
	<xsl:template match="gtsh:Transport">
		<tr>
			<td>
				<xsl:value-of select="gtsh:Mode"/>
			</td>
			<xsl:if test="//cat_ru:VIN">
				<td>
					<xsl:value-of select="cat_ru:VIN"/>
				</td>
			</xsl:if>
			<xsl:if test="//cat_ru:TransportKindCode">
				<td>
					<xsl:value-of select="cat_ru:TransportKindCode"/>
				</td>
			</xsl:if>
			<xsl:if test="//cat_ru:TransportMarkCode">
				<td>
					<xsl:value-of select="cat_ru:TransportMarkCode"/>
				</td>
			</xsl:if>
			<xsl:if test="//cat_ru:TransportIdentifier">
				<td>
					<xsl:value-of select="cat_ru:TransportIdentifier"/>
				</td>
			</xsl:if>
			<xsl:if test="//cat_ru:TransportMeansNationalityCode">
				<td>
					<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
				</td>
			</xsl:if>
			<xsl:if test="//cat_ru:ActiveTransportIdentifier">
				<td>
					<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
				</td>
			</xsl:if>
			<xsl:if test="//cat_ru:TransportRegNumber">
				<td>
					<xsl:value-of select="cat_ru:TransportRegNumber"/>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
	<xsl:template match="gtsh:Seal">
		<tr>
			<td>
				<xsl:value-of select="gtsh:IdentNumber"/>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="gtsh:IdentKind='1'">пломба</xsl:when>
					<xsl:when test="gtsh:IdentKind='2'">печать</xsl:when>
					<xsl:when test="gtsh:IdentKind='3'">иное</xsl:when>
				</xsl:choose>
			</td>
			<xsl:if test="//gtsh:Identprevious">
				<td>
					<xsl:choose>
						<xsl:when test="gtsh:Identprevious='0'">без снятия</xsl:when>
						<xsl:when test="gtsh:Identprevious='1'">со снятием</xsl:when>
					</xsl:choose>
				</td>
			</xsl:if>
			<xsl:if test="//gtsh:IdentDesc">
				<td>
					<xsl:apply-templates select="gtsh:IdentDesc"/>
				</td>
			</xsl:if>
			<xsl:if test="//gtsh:Quantity">
				<td>
					<xsl:apply-templates select="gtsh:Quantity"/>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
	<xsl:template match="gtsh:ProvidedDocuments">
		<tr>
			<xsl:if test="//cat_ru:PrDocumentName">
				<td>
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
			</xsl:if>
			<xsl:if test="//cat_ru:PrDocumentNumber">
				<td>
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</td>
			</xsl:if>
			<xsl:if test="//cat_ru:PrDocumentDate">
				<td>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:PackagePalleteInformationType -->
	<xsl:template match="gtsh:LostPackages">
		<xsl:if test="catESAD_cu:InfoKindCode">
			<xsl:choose>
				<xsl:when test="catESAD_cu:InfoKindCode='0'">Упаковка: </xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='1'">Тара: </xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='2'">Груз: </xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='3'">Поддон: </xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='4'">Инд.упаковка: </xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="catESAD_cu:PalleteCode">
			<xsl:if test="catESAD_cu:InfoKindCode">
				<xsl:text> - </xsl:text>
			</xsl:if>	
			<xsl:text>код: </xsl:text>
			<xsl:value-of select="catESAD_cu:PalleteCode"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:CargoDescriptionText">
			<xsl:if test="catESAD_cu:InfoKindCode or catESAD_cu:InfoKindCode or catESAD_cu:PalleteQuantity">
				<xsl:text> - </xsl:text>
			</xsl:if>	
			<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gtsh:DamageIndicators">
		<tr>
			<td class="graphMargin" valign="bottom" width="40%">Признаки наличия повреждений</td>
			<td class="graphMargin value" valign="bottom" align="center">
				<xsl:choose>
					<xsl:when test="gtsh:IsCargoApartmentDamaged = '1' or gtsh:IsCargoApartmentDamaged='t' or gtsh:IsCargoApartmentDamaged='true'">Повреждено грузовое отделение</xsl:when>
					<xsl:otherwise>Грузовое отделение не повреждено</xsl:otherwise>
				</xsl:choose>
				<br/>
				<xsl:choose>
					<xsl:when test="gtsh:IsSealsDamaged = '1' or gtsh:IsSealsDamaged='t' or gtsh:IsSealsDamaged='true'">Пломбы повреждены</xsl:when>
					<xsl:otherwise>Пломбы не повреждены</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
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
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">; 
				<span class="normal">
						<br/>
					</span>
					<span class="italic">Адрес(а)</span>
					<span class="normal">: </span>
				</xsl:if>
				<xsl:apply-templates mode="ru_address" select="."/>
				<xsl:if test="position()!=last()">
					;<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<br/>
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="normal">, </span>
		<span class="italic">Документ, удостоверяющий личность ФЛ</span>
		<span class="normal">: </span>
		<xsl:if test="RUScat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardDate) &gt; 0 or string-length(RUScat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OrganizationName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<span class="normal">, </span>
			<span class="italic">код подразделения</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<span class="normal">, </span>
			<span class="italic">идентификатор организации</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AuthorityId"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">, </span>
			<span class="italic">страна в уд.личности</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">, </span>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template mode="GTD_num" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dategtd" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
