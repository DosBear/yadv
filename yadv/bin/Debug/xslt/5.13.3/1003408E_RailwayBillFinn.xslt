<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.12.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rwbf="urn:customs.ru:Information:TransportDocuments:Railway:RailwayBillFinn:5.12.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RailwayBillFinnType -->
	<xsl:template match="rwbf:RailwayBillFinn">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					body {
					background: #cccccc;
					}
					
					div.page {
					width: 210mm;
					height: 297mm;
					background: #ffffff;
					border: solid 1pt #000000;
					position:relative;
					}
					
					.bordered {
					border: solid 1pt #000000;
					padding-top:4pt;
					padding-bottom:4pt;
					}
					
					.underlined {
					border-bottom: solid 0.8pt #000000;
					}
					
					p.NumberDate {
					font-weight: bold;
					}
					
					.graph {
					font-family: Arial;
					font-size: 7pt;
					}
					
					.graphNo {
					font-size: 8pt;
					font-weight: bold;
					}
					
					.blank{
						font-family: Arial;
						font-size: 4.5pt;
					}
					.data{
						font-family: Courier New;
						font-size: 10pt;
					}
					.graphNumber{
						font-weight:bold;
					}
					
					.abs{
						position:absolute;
					}
						
					.rel{
						position:relative;
					}
					table, td.bp{
					border: 0.1mm solid black;
					border-collapse: collapse;
					margin:0;
					}
					
					.frontPage
					{
					border: 0;
					border-collapse: collapse;
					margin:0;
					}
					
					.rotate {
					-webkit-transform: rotate(270deg);
					  -moz-transform: rotate(270deg);
					  -ms-transform: rotate(270deg);
					  -o-transform: rotate(270deg);
					  transform: rotate(270deg);
					  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
					}
				</style>
				<title>Finn</title>
			</head>
			<body>
				<!--1. Оригинал-->
				<xsl:call-template name="frontside">
					<xsl:with-param name="headerFin">PAHTIKIRJA&lt;br/&gt;vastaanottajalle</xsl:with-param>
					<xsl:with-param name="headerRus">ОРИГИНАЛ НАКЛАДНОЙ&lt;br/&gt;для получателя</xsl:with-param>
					<xsl:with-param name="sheetNum" select="1"/>
				</xsl:call-template>
				<xsl:call-template name="backside"/>
				<!--2. Дорожная ведомость для дороги назначения-->
				<xsl:call-template name="frontside">
					<xsl:with-param name="headerFin">MATKAKIRJA&lt;br/&gt;määrärautatielle</xsl:with-param>
					<xsl:with-param name="headerRus">ДОРОЖНАЯ ВЕДОМОСТЬ&lt;br/&gt;для дороги назначения</xsl:with-param>
					<xsl:with-param name="sheetNum" select="2"/>
				</xsl:call-template>
				<!--3. Дорожная ведомость для выходной пограничной станции дороги отправления-->
				<xsl:call-template name="frontside">
					<xsl:with-param name="headerFin">MATKAKIRJA&lt;br/&gt;lähetysrautatien&lt;br/&gt;raja-asemalle</xsl:with-param>
					<xsl:with-param name="headerRus">ДОРОЖНАЯ ВЕДОМОСТЬ&lt;br/&gt;для выходной пограничной&lt;br/&gt;станции дороги отправления</xsl:with-param>
					<xsl:with-param name="sheetNum" select="3"/>
				</xsl:call-template>
				<!--4. Дорожная ведомость для станции отправления-->
				<xsl:call-template name="frontside">
					<xsl:with-param name="headerFin">MATKAKIRJA&lt;br/&gt;lähetysasemalle</xsl:with-param>
					<xsl:with-param name="headerRus">ДОРОЖНАЯ ВЕДОМОСТЬ&lt;br/&gt;для станции отправления</xsl:with-param>
					<xsl:with-param name="sheetNum" select="4"/>
				</xsl:call-template>
				<!--5. Дубликат накладной для отправителя-->
				<xsl:call-template name="frontside">
					<xsl:with-param name="headerFin">RAHTIKIRJAN&lt;br/&gt;KAKSOISKAPPALE&lt;br/&gt;lähettäjälle</xsl:with-param>
					<xsl:with-param name="headerRus">ДУБЛИКАТ&lt;br/&gt;НАКЛАДНОЙ&lt;br/&gt;для отправителя</xsl:with-param>
					<xsl:with-param name="sheetNum" select="5"/>
				</xsl:call-template>
			</body>
		</html>
	</xsl:template>
	
	<!--Лицевая сторона-->
	<xsl:template name="frontside">
		<xsl:param name="headerFin"/>
		<xsl:param name="headerRus"/>
		<xsl:param name="sheetNum"/>
		<div class="page">
				<!--Правая сторона верхней части-->
					<div style="position:absolute;left:10mm; top:10mm; width:72mm; height:10mm;border-bottom:1px solid; border-right:1px solid">
						<table width="100%" class="frontPage">
							<tbody>
								<tr style="height:10mm">
									<td class="blank" valign="bottom"><xsl:value-of select="$headerFin" disable-output-escaping="yes"/></td>
									<td class="blank" valign="bottom"><xsl:value-of select="$headerRus" disable-output-escaping="yes"/></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="position:absolute;left:82mm; top:10mm; width:30mm; height:10mm;border-bottom:1px solid; border-left:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">44</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Kuljetuslupa<br/>Разрешение на перевозку</div>
					</div>
					<div class="graphNumber" style="position:absolute;left:10mm; top:20mm; width:10mm; height:48mm;border-left:1px solid;border-bottom:1px solid;">
						<img style="position:absolute;left:0.5mm; top:0.5mm; width:9mm; height:9mm;" src="data:image/png;base64,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"/>
						<div style="position:absolute; left:3mm;top:39mm;font-family:Arial;font-size:20pt;">
							<xsl:value-of select="$sheetNum"/>
						</div>
					</div>
					<div style="position:absolute;left:20mm; top:20mm; width:95mm; height:24mm;border-left:1px solid;border-bottom:1px solid;">
						<div style="position:absolute;left:0mm; top:0mm; width:51mm; height:24mm;">
							<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">1</div>
							<div class="blank" style="position:absolute;left:3mm; top:0mm;">Lähettäjä, postiosoite Отправитель, почтовый адрес</div>
							<div class="data" style="position:absolute; left:1mm; top:3mm;"><xsl:apply-templates select="rwbf:Consignor" /></div>
						</div>
						<div style="position:absolute;left:51mm; top:0mm; width:43.5mm; height:6mm;border:1px solid;"/>
						<div style="position:absolute;left:64mm; top:6.5mm; width:31mm; height:5mm;border-left:1px solid;">
							<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">45</div>
							<div class="data" style="position:absolute; left:2mm; top:1mm;"><xsl:value-of select="rwbf:Consignor/rwbf:RBCode"/></div>
						</div>
					</div>
					<div style="position:absolute;left:20mm; top:44mm; width:95mm; height:24mm;border-left:1px solid;border-bottom:1px solid;">
						<div style="position:absolute;left:0mm; top:0mm; width:51mm; height:24mm;">
							<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">5</div>
							<div class="blank" style="position:absolute;left:3mm; top:0mm;">Vastaanottaja, postiosoite<br/>Получатель, почтовый адрес</div>
							<div class="data" style="position:absolute; left:1mm; top:4mm;"><xsl:apply-templates select="rwbf:Consignee" /></div>
						</div>
						<div style="position:absolute;left:51mm; top:0mm; width:43.5mm; height:6mm;border:1px solid;"/>
						<div style="position:absolute;left:64mm; top:6.5mm; width:31mm; height:5mm;border-left:1px solid;">
							<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">46</div>
							<div class="data" style="position:absolute; left:2mm; top:1mm;"><xsl:value-of select="rwbf:Consignee/rwbf:RBCode"/></div>
						</div>
					</div>
					<div style="position:absolute;left:10mm; top:68mm; width:105mm; height:14mm;border-left:1px solid;border-bottom:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">6</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Merkinnät, jotka eivät sido rautatietä Отметки, не обязательные для железной дороги</div>
						<div class="data" style="position:absolute; left:1mm; top:2mm;">
							<xsl:for-each select="rwbf:ConsignorOptionNotice">
								<xsl:value-of select="."/>
							</xsl:for-each>
						</div>
					</div> 
					<div style="position:absolute;left:10mm; top:82mm; width:105mm; height:22mm;border-left:1px solid;border-bottom:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">7</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Raja-asemat Пограничные станции</div>
						<div class="data" style="position:absolute;left:74mm; top:0mm; width:6mm; height:6mm;border-left:1px solid;border-bottom:1px solid;">
							<xsl:for-each select="rwbf:StationBorder">
								<xsl:value-of select="rwbf:RailwayCode"/>
								<xsl:if test="position()!=last()">
									<br/>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div class="data" style="position:absolute;left:80mm; top:0mm; width:25mm; height:6mm;border-left:1px solid;border-bottom:1px solid;">
							<xsl:for-each select="rwbf:StationBorder">
								<xsl:value-of select="rwbf:StationCode"/>
								<xsl:if test="position()!=last()">
									<br/>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div class="data" style="position:absolute; left:1mm; top:2mm;">
							<xsl:for-each select="rwbf:StationBorder">
								<xsl:value-of select="rwbf:StationName"/><xsl:text> </xsl:text><xsl:value-of select="rwbf:RailwayName"/>
								<xsl:if test="position()!=last()">
									<br/>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
					<div style="position:absolute;left:10mm; top:104mm; width:105mm; height:16mm;border-left:1px solid;border-bottom:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">8</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Määräasema ja-rautatie Пограничные станции</div>
						<div class="data" style="position:absolute;left:74mm; top:0mm; width:6mm; height:6mm;border-left:1px solid;border-bottom:1px solid;">
							<xsl:for-each select="rwbf:StationDestination">
								<xsl:value-of select="rwbf:RailwayCode"/>
								<xsl:if test="position()!=last()">
									<br/>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div class="data" style="position:absolute;left:80mm; top:0mm; width:24.5mm; height:6mm;border-left:1px solid;border-bottom:1px solid;">
							<xsl:for-each select="rwbf:StationDestination">
								<xsl:value-of select="rwbf:StationCode"/>
								<xsl:if test="position()!=last()">
									<br/>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div class="data" style="position:absolute; left:1mm; top:2mm;">
							<xsl:for-each select="rwbf:StationDestination">
								<xsl:value-of select="rwbf:StationName"/><xsl:text> </xsl:text><xsl:value-of select="rwbf:RailwayName"/>
								<xsl:if test="position()!=last()">
									<br/>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				<!--Левая сторона верхней части-->
					<div class="data" style="position:absolute;left:115mm; top:10mm; width:57mm; height:4mm;border-bottom:1px dashed;">
						VR ВР №
						<xsl:for-each select="rwbf:PermissionDocument[rwbf:RailwayID='VR']">
								<xsl:value-of select="cat_ru:PrDocumentNumber"/>
								<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</div>
					<div class="data" style="position:absolute;left:115mm; top:14mm; width:57mm; height:6mm;border-bottom:1px solid;">
						RZD РЖД №
						<xsl:for-each select="rwbf:PermissionDocument[rwbf:RailwayID='RZD']">
								<xsl:value-of select="cat_ru:PrDocumentNumber"/>
								<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</div>
					<div class="blank" style="position:absolute;left:115mm; top:20mm; width:57mm; height:6mm;border-bottom:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:1mm; top:0mm;">2</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Toimitussopimus Договор на поставку №<div class="data"><xsl:value-of select="rwbf:Contract/cat_ru:PrDocumentNumber"/></div></div>
					</div>
					<div class="blank" style="position:absolute;left:172mm; top:15mm; width:27.5mm; height:10.5mm;border:2px solid;">
						<div class="blank graphNumber" style="position:absolute;left:1mm; top:0mm;">25</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Rahtikirja Отправка №
							<div class="data"><xsl:value-of select="rwbf:RegistrationDocument/cat_ru:PrDocumentNumber"/></div>
						</div>
					</div>
					<div class="blank" style="position:absolute;left:115mm; top:26mm; width:85mm; height:12mm;border-left:1px solid;border-bottom:1px solid;border-right:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:1mm; top:0mm;">3</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Lähetysasema ja-rautatie</div>
						<div class="data" style="position:absolute; left:1; top:3;">
							<xsl:value-of select="rwbf:StationDeparture/rwbf:StationName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="rwbf:StationDeparture/rwbf:RailwayName"/>
						</div>
						<div style="position:absolute;left:55mm; top:0mm; width:6mm; height:6mm;border-left:1px solid;border-bottom:1px solid;">
							<div class="data">
								<xsl:value-of select="rwbf:StationDeparture/rwbf:CountryA2Code|rwbf:StationDeparture/rwbf:RailwayCode"/>
							</div>
						</div>
						<div style="position:absolute;left:61mm; top:0mm; width:24mm; height:6mm;border-left:1px solid;border-bottom:1px solid;">
							<div class="data">
								<xsl:value-of select="rwbf:StationDeparture/rwbf:StationCode"/>
							</div>
						</div>
					</div>
					<div style="position:absolute;left:115mm; top:38mm; width:85mm; height:34mm;border-left:1px solid;border-bottom:2px solid;border-right:1px solid">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">4</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Lähettäjän erityisiä ilmoituksia Особые заявления отправителя</div>
						<div class="data" style="position:absolute; left:1mm; top:2mm;">
							<xsl:for-each select="rwbf:ConsignorNotice">
								<xsl:value-of select="."/>
							</xsl:for-each>
						</div>
					</div>
					<div style="position:absolute;left:115mm; top:72mm; width:84.5mm; height:24mm;border-left:2px solid;border-bottom:2px solid;border-right:2px solid">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">26</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Tullin merkintöjä Отметки таможни</div>
						<div class="data" style="position:absolute;left:1mm;top:2mm">
							<xsl:for-each select="rwbf:CustomsNotice">
								<xsl:value-of select="."/>
							</xsl:for-each>
						</div>
					</div>
					<div style="position:absolute;left:115mm; top:96mm; width:85mm; height:8mm;border-left:1px solid;border-bottom:1px solid;border-right:1px solid">
						<table width="100%" class="frontPage">
							<tbody>
								<tr>
									<td>
										<span class="blank graphNumber">27</span>
										<span class="blank">Vaunu<br/>Вагон</span>
									</td>
									<td>
										<span class="blank graphNumber">28</span>
										<span class="blank">Kantavuus<br/>Грузоподъемность</span>
									</td>
									<td>
										<span class="blank graphNumber">29</span>
										<span class="blank">Akseliluki<br/>Кол-во осей</span>
									</td>									
									<td>
										<span class="blank graphNumber">30</span>
										<span class="blank">Taarapaino<br/>Масса тары</span>
									</td>
									<td>
										<span class="blank graphNumber">31</span>
										<span class="blank">Tark.taarapaino<br/>Проверенная масса тары</span>
									</td>								
								</tr>
							</tbody>
						</table>
					</div>
					<div style="position:absolute;left:115mm; top:104mm; width:85mm; height:16mm;border-left:1px solid;border-bottom:1px solid;border-right:1px solid">
						<table>
							<tbody>
								<tr class="blank graphNumber" style="height:4mm">
									<td style="width:45mm;border:1px solid;">27 №</td>
									<td style="width:12mm;border:1px solid;">28 Т</td>
									<td style="width:4mm;border:1px solid;">29</td>
									<td style="width:12mm;border:1px solid;">27 Т</td>
									<td style="width:12mm;border:1px solid;">27 Т</td>
								</tr>
								<xsl:for-each select="rwbf:Carriage">
									<tr class="blank" style="height:6mm">
										<td class="data" style="width:45mm;border:1px solid;">
											<xsl:value-of select="rwbf:CarriageNumber/rwbf:CarriageID"/><xsl:text>/</xsl:text><xsl:value-of select="rwbf:CarriageNumber/rwbf:RailwayCode"/>
										</td>
										<td class="data" style="width:12mm;border:1px solid;">
											<xsl:value-of select="rwbf:Power"/>
										</td>
										<td class="data" style="width:4mm;border:1px solid;">
											<xsl:value-of select="rwbf:AxisQuantity"/>
										</td>
										<td class="data" style="width:12mm;border:1px solid;">
											<xsl:value-of select="rwbf:TrafaretTareMass"/>
										</td>
										<td class="data" style="width:12mm;border:1px solid;">
											<xsl:value-of select="rwbf:CheckTareMass"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
				<!--Средняя часть-->
					<div style="position:absolute;left:10mm; top:120mm; width:10mm; height:60mm;border-bottom:1px solid; border-left:1px solid;">
						<div style="position:absolute;left:-22mm; top:25mm; width:60mm;height:11mm;text-align:center;" class="rotate blank">
							Suomen ja Venäjan rautatieyhdysliikenne<br/>Российско-финляндское прямое<br/>железнодорожное сообщение
						</div>
					</div>
					<div style="position:absolute;left:20mm; top:120mm; width:131mm; height:60mm;border-bottom:1px solid; border-left:1px solid;">
						<table width="100%" class="blank frontPage">
							<tbody>
								<tr style="height:9mm">
									<td style="width:28mm;border-right:1px solid black;" valign="top">9 Kollin / Kontin merkit<br/>ja numerot<br/>Знаки, марки, номера<br/>Владелец и № контейнера</td>
									<td style="width:14mm;border-right:1px solid black;" valign="top">10 Killimäärä<br/>Koko<br/>Число мест<br/>Категория</td>
									<td style="width:19mm;border-right:1px solid black;" valign="top">11 Päällys<br/>Kontin typpi<br/>Род упаковки<br/>Вид контейнера</td>
									<td style="width:54mm;border-right:1px solid black;" valign="top">12 Taravan nimi ja koodi Наименование и код грузов</td>
									<td valign="top">13 Tilavuus<br/>Объем</td>
								</tr>
								<xsl:for-each select="rwbf:GoodsPacking">
									<tr>
										<td class="data">
											<xsl:value-of select="rwbf:PackingMark"/>
											<br/>
											<xsl:for-each select="../rwbf:Container[position()]/rwbf:ContainerID">
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
										<td class="data">
											<xsl:value-of select="rwbf:CargoQuantity"/><xsl:text> </xsl:text><xsl:value-of select="rwbf:CargoQuantityWords"/>
											<br/>
											<xsl:value-of select="../rwbf:Container[position()]/rwbf:ContainerQuantity"/><xsl:text> </xsl:text><xsl:value-of select="../rwbf:Container[position()]/rwbf:ContainerCategory"/>
										</td>
										<td class="data">
											<xsl:value-of select="rwbf:PackingCode"/><xsl:text> </xsl:text><xsl:value-of select="rwbf:PackingDescription"/>
											<br/>
											<xsl:value-of select="../rwbf:Container[position()]/rwbf:ContainerKind"/><xsl:text> </xsl:text><xsl:value-of select="../rwbf:Container[position()]/rwbf:ContainerDescription"/>
										</td>
										<td class="data">
											<xsl:apply-templates mode="spaceSeparated" select="../rwbf:GoodsNameNotes[position()]"/>
										</td>
										<td class="data">
											<xsl:value-of select="rwbf:VolumeQuantity"/>
											<br/>
											<xsl:value-of select="../rwbf:Container[position()]/rwbf:ContainerCapacity"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<div style="position:absolute;left:151mm; top:120mm; width:49mm; height:4mm;border-bottom:1px solid; border-left:1px solid;border-right:1px solid;">
						<div class="blank">Paino kg Масса в кг определена</div>
					</div>
					<div style="position:absolute;left:151mm; top:124mm; width:24.5mm; height:44mm;border-bottom:1px solid; border-left:1px solid;border-right:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">14</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">lähettäjän ilmottama<br/>отправителем</div>
						<div class="data" style="position:absolute;left:1mm;top:3mm;"><xsl:value-of select="rwbf:GrossWeightQuantity/rwbf:QuantityNumber"/></div>
					</div>
					<div style="position:absolute;left:175.5mm; top:124mm; width:24mm; height:43.5mm; border-top:2px solid; border-bottom:2px solid; border-left:2px solid;border-right:2px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">32</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">rautat. toteama<br/>железной дорогой</div>
						<div class="data" style="position:absolute;left:1mm;top:3mm;"><xsl:value-of select="rwbf:GrossWeightQuantityRW/rwbf:GrossWeightQuantity"/></div>
					</div>
					<div style="position:absolute;left:151mm; top:168mm; width:49mm; height:12mm; border-bottom:1px solid; border-left:1px solid;border-right:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">15</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Lähettäjän allekirjoitus Подпись отправителя</div>
						<div class="data" style="position:absolute;left:1mm; top:3mm;"><xsl:value-of select="rwbf:ConsignorSign"/></div>
					</div>
				<!--Правая сторона нижней части-->
					<div style="position:absolute;left:10mm; top:180mm; width:94mm; height:8mm; border-left:1px solid; border-bottom:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">16</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Yhtensä kolleja (kirjaimin) Итого мест прописью</div>
						<div class="data" style="position:absolute;left:1mm;top:2mm;"><xsl:value-of select="rwbf:PlacesQuantity/rwbf:QuantityWords"/></div>
					</div>
					<div style="position:absolute;left:10mm; top:188mm; width:94mm; height:6mm; border-left:1px solid; border-bottom:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">20</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Kuljetusmaksut suorittaa Платежи за перевозку оплачивает</div>
					</div>
					<div style="position:absolute;left:10mm; top:194mm; width:94mm; height:14mm; border-left:1px solid; border-bottom:1px dashed;">
						<div class="blank" style="position:absolute;left:1mm; top:0mm;">lähetysrautatien osuudella<br/>по железным дорогам страны отправления</div>
						<div class="data" style="position:absolute;left:1mm; top:3mm">
							<xsl:for-each select="rwbf:PaidRailwayCodeName[rwbf:IDPaid='1']">
								<xsl:value-of select="rwbf:InfoPayer/rwbf:PayerName"/><xsl:text> </xsl:text><xsl:value-of select="rwbf:InfoPayer/rwbf:PayerCode"/>
							</xsl:for-each>
						</div>
						<div class="blank" style="position:absolute;left:53mm; top:0mm;">asiakasnro код клиента</div>
					</div>
					<div style="position:absolute;left:10mm; top:208mm; width:94mm; height:30mm; border-left:1px solid; border-bottom:1px dashed;">
						<div class="blank" style="position:absolute;left:1mm; top:0mm;">kauttakuljetesrautateiden osuudelia по транзитным железным дорогам</div>
						<div class="data" style="position:absolute;left:1mm; top:2mm;">
							<xsl:for-each select="rwbf:PaidRailwayCodeName[rwbf:IDPaid='2']">
								<xsl:value-of select="rwbf:InfoPayer/rwbf:PayerName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rwbf:InfoPayer/rwbf:PayerCode"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rwbf:PaidRailwayCode"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rwbf:PaidRailwayName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rwbf:PaidRailwayShortName"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</div>
					</div>
					<div style="position:absolute;left:10mm; top:238mm; width:94mm; height:14mm; border-left:1px solid; border-bottom:1px solid;">
						<div class="blank" style="position:absolute;left:1mm; top:0mm;">määrärautatien osuudella<br/>по железным дорогам страны назначения</div>
						<div class="data" style="position:absolute;left:1mm; top:3mm;">
							<xsl:for-each select="rwbf:PaidRailwayCodeName[rwbf:IDPaid='3']">
								<xsl:value-of select="rwbf:InfoPayer/rwbf:PayerName"/><xsl:text> </xsl:text><xsl:value-of select="rwbf:InfoPayer/rwbf:PayerCode"/>
							</xsl:for-each>
						</div>
						<div class="blank" style="position:absolute;left:53mm; top:0mm;">asiakasnro код клиента</div>
					</div>
					<div style="position:absolute;left:10mm; top:252mm; width:94mm; height:8mm; border-left:1px solid; border-bottom:2px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">24</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Hankintaety Объявленная ценность груза в </div>
						<div class="data" style="position:absolute;left:1mm;top:2mm;">
							<xsl:for-each select="rwbf:CargoValue">
								<xsl:value-of select="concat(rwbf:SumNumber,' (',rwbf:SumWords,') ',rwbf:CurrencyCode)"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</div>
					</div>
					<div style="position:absolute;left:10mm; top:260mm; width:47mm; height:24mm; border-left:2px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">40</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Lähetysaseman päiväleima<br/>Календарный штемпель станции отправления</div>
						<div class="data" style="position:absolute;left:1mm;top:4mm;">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="rwbf:StationDeparture/rwbf:DateStamp"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="position:absolute;left:57mm; top:260mm; width:47mm; height:24mm; border-left:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">41</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Määräaseman päiväleima<br/>Календарный штемпель станции назначения</div>
						<div class="data" style="position:absolute;left:1mm;top:4mm;">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="rwbf:StationDestination/rwbf:DateStamp"/>
							</xsl:call-template>
						</div>
					</div>
				<!--Левая сторона нижней части-->
					<div style="position:absolute;left:104mm; top:180mm; width:96mm; height:8mm; border-left:1px solid; border-bottom:1px solid; border-right:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">17</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Paino yhteensä (kirjaimin) Итого масса прописью</div>
						<div class="data" style="position:absolute;left:1mm; top:2mm;"><xsl:value-of select="rwbf:GrossWeightQuantity/rwbf:QuantityWords"/></div>
					</div>
					<div style="position:absolute;left:104mm; top:188mm; width:96mm; height:14mm; border-left:1px solid; border-bottom:1px solid; border-right:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">21</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Lahetyksen laji Род отправки</div>
						<div class="data" style="position:absolute;left:1mm; top:3mm; width:3.5mm; height:3.5mm; border:1px solid;" align="center">
							<xsl:if test="rwbf:DepartureMode='1'">X</xsl:if>
						</div>
						<div style="position:absolute;left:6mm; top:3mm; width:10mm; height:3.5mm" class="blank">Kpl-tavara<br/>Мелкая</div>
						<div class="data" style="position:absolute;left:19mm; top:3mm; width:3.5mm; height:3.5mm; border:1px solid;" align="center">
							<xsl:if test="rwbf:DepartureMode='2'">X</xsl:if>
						</div>
						<div style="position:absolute;left:24mm; top:3mm; width:13mm; height:3.5mm" class="blank">Vaulunkuorma<br/>Повагонная</div>
						<div class="data" style="position:absolute;left:38mm; top:3mm; width:3.5mm; height:3.5mm; border:1px solid;" align="center">
							<xsl:if test="rwbf:DepartureMode='3'">X</xsl:if>
						</div>
						<div style="position:absolute;left:43mm; top:3mm; width:13mm; height:3.5mm" class="blank">Kontii<br/>Контейнерная</div>
						<div style="position:absolute;left:56mm; top:0mm; width:1mm; height:11mm; border-left:1px solid;"/>
						<div class="blank graphNumber" style="position:absolute;left:57mm; top:0mm;">22</div>
						<div class="blank" style="position:absolute;left:60mm; top:0mm;">Kuormajaa Погружено</div>
						<div class="data" style="position:absolute;left:57mm; top:3mm; width:3.5mm; height:3.5mm; border:1px solid;" align="center">
							<xsl:if test="rwbf:LoaderMode='1'">X</xsl:if>
						</div>
						<div style="position:absolute;left:62mm; top:3mm; width:13mm; height:3.5mm" class="blank">Lähettäjä<br/>Отправителем</div>
						<div class="data" style="position:absolute;left:77mm; top:3mm; width:3.5mm; height:3.5mm; border:1px solid;" align="center">
							<xsl:if test="rwbf:LoaderMode='2'">X</xsl:if>
						</div>
						<div style="position:absolute;left:82mm; top:3mm; width:13mm; height:3.5mm" class="blank">Rautatie<br/>Жел.дорогой</div>
						<div style="position:absolute;left:1mm; top:11mm; width:3.5mm; height:2.5mm; border:1px solid;" class="blank" align="center">X</div>
						<div style="position:absolute;left:6mm; top:11mm;" class="blank">Rastita oikea vaihtoehto Нужное отметить крестиком</div>
					</div>
					<div style="position:absolute;left:104mm; top:202mm; width:96mm; height:30mm; border-left:1px solid; border-bottom:1px solid; border-right:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">23</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Lähettäjän liitteet Документы, приложенные отправителем</div>
						<div class="data" style="position:absolute;left:1mm;top:2mm;">
							<xsl:for-each select="rwbf:ConsignorDocument">
								<xsl:value-of select="cat_ru:PrDocumentName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:PrDocumentNumber"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="cat_ru:PrDocumentDate"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
							<xsl:if test="rwbf:AdditionalSheetQuantity">
								<br/>
								<xsl:value-of select="rwbf:AdditionalSheetQuantity"/>
							</xsl:if>
						</div>
					</div>
					<div style="position:absolute;left:104mm; top:232mm; width:96mm; height:12mm; border-left:1px solid; border-bottom:1px solid; border-right:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">39</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Sinetit Пломбы, ЗПУ</div>
						<div class="data" style="position:absolute;left:1mm; top:4mm; width:3.5mm; height:3.5mm; border:1px solid;" align="center">
							<xsl:if test="rwbf:Seal/rwbf:SealOwner='1'">X</xsl:if>
						</div>
						<div style="position:absolute;left:6mm; top:5mm; width:30mm; height:3.5mm" class="blank">lähettäjän отправителя</div>
						<div class="data" style="position:absolute;left:45mm; top:4mm; width:3.5mm; height:3.5mm; border:1px solid;" align="center">
							<xsl:if test="rwbf:Seal/rwbf:SealOwner='2'">X</xsl:if>
						</div>
						<div style="position:absolute;left:50mm; top:5mm; width:30mm; height:3.5mm" class="blank">rautatien железной дорогой</div>
						<div style="position:absolute;left:1mm; top:9mm; width:3.5mm; height:2.5mm; border:1px solid;" class="blank" align="center">X</div>
						<div style="position:absolute;left:6mm; top:9mm;" class="blank">Rastita oikea vaihtoehto Нужное отметить крестиком</div>
					</div>
					<div style="position:absolute;left:104mm; top:244mm; width:75mm; height:16mm;border-left:1px solid;border-bottom:2px solid;border-right:1px solid">
						<table>
							<tbody>
								<tr class="blank graphNumber" style="height:4mm">
									<td style="width:17mm;border:1px solid;">Maara Кол-во</td>
									<td style="width:58mm;border:1px solid;">Merkit ja numerot Знаки</td>
								</tr>
								<tr class="blank" style="height:6mm">
									<td class="data" style="width:17mm;border:1px solid;"><xsl:value-of select="rwbf:Seal[1]/rwbf:SealQuantity"/></td>
									<td class="data" style="width:58mm;border:1px solid;"><xsl:value-of select="rwbf:Seal[1]/rwbf:SealID"/></td>
								</tr>
								<tr class="blank" style="height:6mm">
									<td class="data" style="width:17mm;border:1px solid;"><xsl:value-of select="rwbf:Seal[2]/rwbf:SealQuantity"/></td>
									<td class="data" style="width:58mm;border:1px solid;"><xsl:value-of select="rwbf:Seal[2]/rwbf:SealID"/></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="position:absolute;left:179mm; top:244mm; width:21mm; height:8mm; border-left:2px solid; border-top:2px solid; border-right:2px solid; border-bottom:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">34</div>
						<div class="data" style="position:absolute;left:1mm;top:2mm;">
							<xsl:value-of select="rwbf:NoteInfo[rwbf:GrafaID='34']/rwbf:Note"/>
						</div>
					</div>
					<div style="position:absolute;left:179mm; top:252mm; width:21mm; height:8mm; border-left:2px solid; border-right:2px solid; border-bottom:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">35</div>
						<div class="data" style="position:absolute;left:1mm;top:2mm;">
							<xsl:value-of select="rwbf:NoteInfo[rwbf:GrafaID='35']/rwbf:Note"/>
						</div>
					</div>
					<div style="position:absolute;left:179mm; top:260mm; width:21mm; height:8mm; border-left:2px solid; border-right:2px solid; border-bottom:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">36</div>
						<div class="data" style="position:absolute;left:1mm;top:2mm;">
							<xsl:value-of select="rwbf:NoteInfo[rwbf:GrafaID='36']/rwbf:Note"/>
						</div>
					</div>
					<div style="position:absolute;left:179mm; top:268mm; width:21mm; height:8mm; border-left:2px solid; border-right:2px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">37</div>
						<div class="data" style="position:absolute;left:1mm;top:2mm;">
							<xsl:value-of select="rwbf:NoteInfo[rwbf:GrafaID='37']/rwbf:Note"/>
						</div>
					</div>
					<div style="position:absolute;left:179mm; top:276mm; width:21mm; height:8mm; border-left:2px solid; border-right:2px solid; border-bottom:2px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">38</div>
						<div class="data" style="position:absolute;left:1mm;top:2mm;">
							<xsl:value-of select="rwbf:NoteInfo[rwbf:GrafaID='38']/rwbf:Note"/>
						</div>
					</div>
					<div style="position:absolute;left:104mm; top:260mm; width:31mm; height:24mm; border-left:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">42</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Painon määrittelytapa<br/>Способ определения массы</div>
						<div class="data" style="position:absolute;left:1mm;top:4mm;">
							<xsl:value-of select="rwbf:WeightDefinitionModeDescription"/>
						</div>
					</div>
					<div style="position:absolute;left:135mm; top:260mm; width:44mm; height:24mm; border-left:1px solid;">
						<div class="blank graphNumber" style="position:absolute;left:0mm; top:0mm;">43</div>
						<div class="blank" style="position:absolute;left:3mm; top:0mm;">Punnitusaseman leima, allekirjoitus<br/>Штемпель странции взвешивания, подпись</div>
						<div class="data" style="position:absolute;left:1mm;top:4mm;">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="rwbf:StationDestination/rwbf:DateStamp"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
	</xsl:template>
	
	<!--Оборотная сторона-->
	<xsl:template name="backside">
		<div class="page">
			<div class="abs" style="left:10mm; top:10mm;">
				<!--Шапка-->
				<div class="abs" style="left:0mm; top:0mm; width:58mm; height:18mm;border:1px solid;">
					<div class="abs blank graphNumber" style="left:0mm; top:0mm;">53</div>
					<div class="abs blank" style="left:2mm;top:0mm;">Liikenneyhteys Сообщение</div>
					<div class="abs" style="left:44mm;top:0mm;width:4mm;height:8mm;border-left:1px solid;"></div>
					<div class="abs" style="left:48mm;top:4mm;width:3mm;height:4mm;border-left:1px dashed;"></div>
					<div class="abs" style="left:51mm;top:0mm;width:4mm;height:8mm;border-left:1px solid;"></div>
					<div class="abs" style="left:55mm;top:4mm;width:3mm;height:4mm;border-left:1px dashed;"></div>
				</div>
				<div class="abs" style="left:58mm;top:0mm;width:18mm;height:18mm;border:1px solid;border-right:0;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">60</div>
					<div class="abs blank" style="left:0mm;top:2mm;">Tavarakoodi<br/>№ позиции</div>
				</div>
				<div class="abs" style="left:76mm;top:0mm;width:9mm;height:18mm;border:1px solid;border-right:0;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">61</div>
					<div class="abs blank" style="left:0mm;top:2mm;">Luokka<br/>Класс</div>
				</div>
				<div class="abs" style="left:85mm;top:0mm;width:13mm;height:18mm;border:1px solid;border-right:0;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">62</div>
					<div class="abs blank" style="left:0mm;top:2mm;">Yks.hinta<br/>Ставка</div>
				</div>
				<div class="abs" style="left:98mm;top:0mm;width:20mm;height:18mm;border:1px solid;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">63</div>
					<div class="abs blank" style="left:0mm;top:2mm;">Hinnoittelupaino<br/>Расчетная масса</div>
					<div class="abs blank" style="left:2mm;top:12mm;">kg кг</div>
				</div>
				<div class="abs" style="left:118mm;top:0mm;width:36mm;height:7mm;border:1px solid;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">68</div>
					<div class="abs blank" style="left:3mm;top:0mm;">Lähettäjä maksanut<br/>Расчеты с отправителем</div>
				</div>
				<div class="abs" style="left:118mm;top:7mm;width:18mm;height:11mm;border:1px solid;border-top:0;border-right:0;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">70</div>
					<div class="abs blank" style="left:3mm;top:0mm;">Summa ja<br/>valuutta<br/>Сумма в</div>
				</div>
				<div class="abs" style="left:136mm;top:7mm;width:18mm;height:11mm;border:1px solid;border-top:0;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">71</div>
					<div class="abs blank" style="left:3mm;top:0mm;">Summa ja<br/>valuutta<br/>Сумма в</div>
				</div>
				<div class="abs" style="left:154mm;top:0mm;width:35mm;height:7mm;border:1px solid;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">68</div>
					<div class="abs blank" style="left:3mm;top:0mm;">Lähettäjä maksanut<br/>Расчеты с получателем</div>
				</div>
				<div class="abs" style="left:154mm;top:7mm;width:17.5mm;height:11mm;border:1px solid;border-top:0;border-right:0;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">72</div>
					<div class="abs blank" style="left:3mm;top:0mm;">Summa ja<br/>valuutta<br/>Сумма в</div>
				</div>
				<div class="abs" style="left:171.5mm;top:7mm;width:17.5mm;height:11mm;border:1px solid;border-top:0;">
					<div class="abs blank graphNumber" style="left:0mm;top:0mm;">73</div>
					<div class="abs blank" style="left:3mm;top:0mm;">Summa ja<br/>valuutta<br/>Сумма в</div>
				</div>
			</div>
		</div>	
	</xsl:template>
	
	<!--Информация об отправителе/о получателе-->
	<xsl:template match="rwbf:Consignor|rwbf:Consignee">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates mode="commaSeparated" select="cat_ru:Address"/>
	</xsl:template>
	
	<xsl:template mode="commaSeparated" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template mode="spaceSeparated" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="cat_ru:PrDocumentDate">
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="."/>
		</xsl:call-template>
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
