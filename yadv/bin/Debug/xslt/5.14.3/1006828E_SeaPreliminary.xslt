<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="urn:customs.ru:Information:CustomsDocuments:SeaPreliminary:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.14.3" xmlns:cltpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonLeafTypes:5.14.3" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.14.3">
	<!-- Шаблон для типа SeaPreliminaryType -->
	<xsl:template match="sp:SeaPreliminary">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
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
                  border: 1px solid gray;
                  }

                  .value
                  {
                  border-bottom: solid 1px gray;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px gray;
                  font-size: 8pt;
                  vertical-align:top;
                  }
                  
                  td.part {
					font-style: oblique;
					color: #333;
					text-decoration: underline;
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
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr class="title" align="center">
								<td class="bordered" colspan="4" style="text-decoration:underline">Предварительная информация о товарах, предполагаемых к ввозу на таможенную территорию Евразийского экономического союза водным транспортом</td>
							</tr>
							<xsl:if test="sp:RegNumber">
								<tr>
									<td class="bordered" colspan="4">
										Регистрационный номер предварительной информации, содержащей обязательный состав сведений <br/>
										<xsl:apply-templates select="sp:RegNumber" mode="regnum"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="sp:RefRegNumber">
								<tr>
									<td class="bordered" colspan="4">
										Регистрационный номер предварительной информации, в отношении которой осуществляется повторное представление предварительной информации <br/>
										<xsl:apply-templates select="sp:RefRegNumber" mode="regnum"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="sp:UsageCode">
								<tr>
									<td class="bordered" colspan="4">
										Код цели представления предварительной информации <br/>
										<xsl:for-each select="sp:UsageCode">
											<xsl:if test="position() &gt; 1">, </xsl:if>
											<xsl:value-of select="."/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="sp:ArrivalDateTime">
								<tr>
									<td class="bordered" colspan="4">Планируемые (расчетные) дата и время прибытия<br/>
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="sp:ArrivalDateTime"/></xsl:call-template>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(sp:ArrivalDateTime, 12, 8)"/>
									</td>
								</tr>
							</xsl:if>
							
							<xsl:if test="sp:EntryCheckPointDetails">
								<tr class="title" align="center">
									<td class="bordered" colspan="4" style="background-color:#ccc;">Место прибытия товаров</td>
								</tr>
								<xsl:apply-templates select="sp:EntryCheckPointDetails"/>
							</xsl:if>
							
							<tr class="title" align="center">
								<td class="bordered" colspan="4" style="background-color:#ccc;">Лицо, представившее предварительную информацию</td>
							</tr>
							<xsl:apply-templates select="sp:DeclarantDetails" mode="org"/>
							
							<tr class="title" align="center">
								<td class="bordered" colspan="4" style="background-color:#ccc;">Сведения о транспортном средстве</td>
							</tr>
							<xsl:apply-templates select="sp:BorderTransportDetails"/>
							
							<xsl:apply-templates select="sp:ConsignmentDetails"/>
							
							<xsl:if test="sp:PICarrierInfo">
								<tr class="title">
									<td class="bordered" colspan="4" style="background-color:#ccc;">Перевозчик, осуществляющий ввоз товаров на таможенную территорию Евразийского экономического союза</td>
								</tr>
								<xsl:apply-templates select="sp:PICarrierInfo" mode="org"/>
							</xsl:if>
							
							<xsl:if test="sp:AgentDetails">
								<tr class="title">
									<td class="bordered" colspan="4" style="background-color:#ccc;">Судовой агент</td>
								</tr>
								<xsl:apply-templates select="sp:AgentDetails" mode="org"/>
							</xsl:if>
							
							<xsl:apply-templates select="sp:StoresInfo"/>
							
							<tr>
								<td class="bordered" colspan="2" style="background-color:#ddd;">
									Наркотические, сильнодействующие средства, психотропные и ядовитые вещества:<br/>
									<xsl:apply-templates select="sp:DrugsIndicator" mode="indicator"/>
								</td>
								<td class="bordered" colspan="2" style="background-color:#ddd;">
									Опасные грузы:<br/>
									<xsl:apply-templates select="sp:DangerousGoodsIndicator" mode="indicator"/>
								</td>
							</tr>
							
							<xsl:apply-templates select="sp:SparePartsInfo"/>
							
							<xsl:apply-templates select="sp:EpidemicControlDetails"/>
							
							<xsl:if test="sp:DiseasedPersonDetails">
								<tr class="title">
									<td class="bordered" colspan="4" style="background-color:#ccc;">Лицо, у которого выявлено заболевание или обнаружено подозрение на заболевание</td>
								</tr>
								<xsl:apply-templates select="sp:DiseasedPersonDetails"/>
							</xsl:if>
							
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="sp:DiseasedPersonDetails">
		<tr>
			<td class="bordered">
				<xsl:apply-templates select="sp:Person" mode="spaced"/>
			</td>
			<td class="bordered">
				<xsl:choose>
					<xsl:when test="sp:RoleCode=1">член экипажа</xsl:when>
					<xsl:when test="sp:RoleCode=2">пассажир</xsl:when>
					<xsl:otherwise><xsl:value-of select="sp:RoleCode"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="bordered" colspan="2">
				<xsl:value-of select="sp:DiseaseDescription"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="sp:EpidemicControlDetails">
		<tr class="title">
			<td class="bordered" colspan="4" style="background-color:#ccc;">Санитарно-эпидемиологический надзор</td>
		</tr>
		<tr>
			<td class="bordered">
				Освобождение от санитарного контроля:<br/>
				<xsl:apply-templates select="sp:DisinfestationIndicator" mode="indicator_yn"/>
			</td>
			<td class="bordered">
				Свидетельство:<br/>
				<xsl:apply-templates select="sp:SanitaryControlDocDetails" mode="doc"/>
			</td>
			<td class="bordered">
				Необходимость повторной инспекции:<br/>
				<xsl:apply-templates select="sp:RepeatInspection" mode="indicator_yn"/>
			</td>
			<td class="bordered">
				Посещение зараженной территории:<br/>
				<xsl:apply-templates select="sp:AffectedAreaVisitIndicator" mode="indicator_yn"/>
			</td>
		</tr>
		<xsl:if test="sp:AffectedPortDetails">
			<tr>
				<td class="bordered">Сведения о заходе в порт на зараженной территории</td>
				<td class="bordered" colspan="3">
					<xsl:for-each select="sp:AffectedPortDetails">
						<xsl:if test="position() &gt; 1">;<br/></xsl:if>
						<xsl:apply-templates select="." mode="comma"/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td class="bordered">
				Признак наличия случаев смерти:<br/>
				<xsl:apply-templates select="sp:DeadIndicator" mode="indicator"/>
			</td>
			<td class="bordered">
				Число умерших:<br/>
				<xsl:apply-templates select="sp:DeadQuantity"/>
			</td>
			<td class="bordered">
				Необычный уроверь заболеваемости:<br/>
				<xsl:apply-templates select="sp:AbnormalDiseasePersonIndicator" mode="indicator_yn"/>
			</td>
			<td class="bordered">
				Случаи заболеваний или лиц с подозрениями на инфекционные заболевания на борту:<br/>
				<xsl:apply-templates select="sp:DiseasedPerson" mode="indicator_yn"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Заболевшие и с подозрением на заболевание:<br/>
				<xsl:value-of select="sp:DiseasedPersonQuantity"/>
			</td>
			<td class="bordered">
				Консультация с врачом:<br/>
				<xsl:apply-templates select="sp:MedicalConsultationIndicator" mode="indicator_yn"/>
			</td>
			<td class="bordered">
				Наличие информации об обстоятельствах, ведущих к заражению или распространению болезни:<br/>
				<xsl:apply-templates select="sp:DiseaseSpreadIndicator" mode="indicator_yn"/>
			</td>
			<td class="bordered">
				Описание обстоятельств:<br/>
				<xsl:value-of select="sp:DiseaseSpreadText"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">Проведение медико-санитарных мер:</td>
			<td class="bordered" colspan="3">
				<xsl:apply-templates select="sp:SanitaryMeasureIndicator" mode="indicator"/>
			</td>
		</tr>
		<xsl:if test="sp:SanitaryMeasureDetails">
			<tr>
				<td class="bordered" colspan="4">
					<table>
						<tbody>
							<tr>
								<td class="bordered">Мера</td>
								<td class="bordered">Описание</td>
								<td class="bordered">Дата</td>
								<td class="bordered">Место</td>
							</tr>
							<xsl:apply-templates select="sp:SanitaryMeasureDetails"/>
						</tbody>
					</table>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td class="bordered">
				Наличие безбилетных пассажиров:<br/>
				<xsl:apply-templates select="sp:StowawaysIndicator" mode="indicator_yn"/>
			</td>
			<td class="bordered">
				Дата появления на борту безбилетных пассажиров:<br/>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="sp:EmbarkationDate"/></xsl:call-template>
			</td>
			<td class="bordered">
				Наличие больных животных:<br/>
				<xsl:apply-templates select="sp:SickAnimalIndicator" mode="indicator_yn"/>
			</td>
			<td class="bordered">
				Необходимость размещения на санитарном рейде:<br/>
				<xsl:apply-templates select="sp:SanitaryRoadsteadIndicator" mode="indicator_yn"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="4">
				Ограничение свободной практики в порту:<br/>
				<xsl:apply-templates select="sp:FreePracticeRestrictionIndicator" mode="indicator_yn"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="4">Противоэпидемическая готовность</td>
		</tr>
		<xsl:apply-templates select="sp:AntiepidemicReadyDetails"/>
		
		<xsl:apply-templates select="sp:PestControlDetails"/>
	</xsl:template>
	
	<xsl:template match="sp:AntiepidemicReadyDetails">
		<tr>
			<td class="bordered">
				Противоэпидемическое имущество:<br/>
				<xsl:apply-templates select="sp:AntiepidemicEquipmentIndicator" mode="indicator"/>
			</td>
			<td class="bordered">
				Описание имущества:<br/>
				<xsl:value-of select="sp:AntiepidemicEquipmentDescription"/>
			</td>
			<td class="bordered">
				Подготовка экипажа:<br/>
				<xsl:apply-templates select="sp:TrainingIndicator" mode="indicator"/>
			</td>
			<td class="bordered">
				Описание подготовки:<br/>
				<xsl:value-of select="sp:TrainingDescription"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="sp:SanitaryMeasureDetails">
		<tr>
			<td class="bordered">
				<xsl:choose>
					<xsl:when test="sp:SanitaryMeasureCode = 1">карантин</xsl:when>
					<xsl:when test="sp:SanitaryMeasureCode = 1">изоляция</xsl:when>
					<xsl:when test="sp:SanitaryMeasureCode = 1">дезинфекция</xsl:when>
					<xsl:when test="sp:SanitaryMeasureCode = 1">деконтаминация</xsl:when>
					<xsl:when test="sp:SanitaryMeasureCode = 1">иное</xsl:when>
					<xsl:otherwise><xsl:value-of select="sp:SanitaryMeasureCode"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="bordered">
				<xsl:value-of select="sp:DescriptionText"/>
			</td>
			<td class="bordered">
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="sp:EventDate"/></xsl:call-template>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="sp:SanitaryMeasureLocationDetails" mode="comma"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="sp:PestControlDetails">
		<tr>
			<td class="bordered">Проведение дезинсекции</td>
			<td class="bordered" colspan="3"><xsl:apply-templates select="sp:DisinfestationIndicator" mode="indicator"/></td>
		</tr>
		<xsl:if test="sp:DisinfestationDetails">
			<tr>
				<td class="bordered" colspan="4">Детали проведения дезинсекции</td>
			</tr>
			<tr>
				<td class="bordered">Код</td>
				<td class="bordered">Описание</td>
				<td class="bordered">Дата</td>
				<td class="bordered">Место</td>
			</tr>
			<xsl:for-each select="sp:DisinfestationDetails">
				<tr>
					<td class="bordered">
						<xsl:value-of select="sp:DisinfestationCode"/>
					</td>
					<td class="bordered">
						<xsl:value-of select="sp:DisinfestationMethod"/>
					</td>
					<td class="bordered">
						<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="sp:DisinfestationDate"/></xsl:call-template>
					</td>
					<td class="bordered">
						<xsl:value-of select="sp:DisinfestationPlace"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="sp:SparePartsInfo">
		<tr class="title">
			<td class="bordered" colspan="4" style="background-color:#ccc;">Запчасти или оборудование для ремонта</td>
		</tr>
		<tr>
			<td class="bordered">Наличие запасных частей</td>
			<td class="bordered" colspan="3"><xsl:apply-templates select="catpi_ru:StoreIndicator" mode="indicator"/></td>
		</tr>
		<xsl:if test="catpi_ru:SparePartsItemDetails">
			<tr>
				<td class="bordered" colspan="4">Наименование и количиество запчастей</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:SparePartsItemDetails"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="catpi_ru:SparePartsItemDetails">
		<tr>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
			</td>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="catpi_ru:Quantity" mode="quantity"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="sp:StoresInfo">
		<tr class="title">
			<td class="bordered" colspan="4" style="background-color:#ccc;">Припасы</td>
		</tr>
		<tr>
			<td class="bordered">Наличие припасов на борту ТС</td>
			<td class="bordered" colspan="3"><xsl:apply-templates select="catpi_ru:StoreIndicator" mode="indicator"/></td>
		</tr>
		<xsl:if test="catpi_ru:StoreItemDetails">
			<tr>
				<td class="bordered" colspan="4">Наименование и количиество припасов</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:StoreItemDetails"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="catpi_ru:StoreItemDetails">
		<tr>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
			</td>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="catpi_ru:Quantity" mode="quantity"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="sp:ConsignmentDetails">
		<tr class="title" align="center">
			<td class="bordered" colspan="4" style="font-style: oblique; background-color: #999">Сведения о товарной партии</td>
		</tr>
		<tr>
			<td class="bordered">
				Код цели предоставления:<br/>
				<xsl:for-each select="sp:UsageCode">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Транспортный документ:<br/>
				<xsl:apply-templates select="sp:TransportDocumentDetails" mode="doc"/>
			</td>
			<td class="bordered">
				Рег.номер ТД<br/>
				<xsl:apply-templates select="sp:CustomsDocIdDetails" mode="regnum"/>
			</td>
			<td class="bordered">
				Код типа ТД<br/>
				<xsl:value-of select="sp:CustomsProcedure"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код особенности перевозки<br/>
				<xsl:value-of select="sp:TransitDirectionCode"/>
			</td>
			<td class="bordered">
				Особенность помещения под процедуру<br/>
				<xsl:value-of select="sp:TransitFeature"/>
			</td>
			<td class="bordered">
				Кол-во отгрузочных спецификаций<br/>
				<xsl:value-of select="sp:SpecificationNumber"/>
			</td>
			<td class="bordered">
				Кол-во листов отгр.спецификаций<br/>
				<xsl:value-of select="sp:SpecificationListNumber"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Общее кол-во товаров<br/>
				<xsl:value-of select="sp:TotalGoodsNumber"/>
			</td>
			<td class="bordered">
				Общее кол-во грузовых мест<br/>
				<xsl:value-of select="sp:TotalPackageNumber"/>
			</td>
			<td class="bordered">
				Страна отправления<br/>
				<xsl:apply-templates select="sp:DispatchCountry" mode="spaced"/>
			</td>
			<td class="bordered">
				Страна назначения<br/>
				<xsl:apply-templates select="sp:DestinationCountry" mode="spaced"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Общая стоимость товаров<br/>
				<xsl:apply-templates select="sp:CAInvoiceValueAmount" mode="spaced"/>
			</td>
			<td class="bordered">
				Общий вес брутто (кг)<br/>
				<xsl:value-of select="sp:GrossWeightQuantity"/>
			</td>
			<td class="bordered">

			</td>
			<td class="bordered">
			
			</td>
		</tr>
		<xsl:if test="sp:ConsignorDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Отправитель</td>
			</tr>
			<xsl:apply-templates select="sp:ConsignorDetails" mode="org"/>
		</xsl:if>
		<xsl:if test="sp:ConsigneeDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Получатель</td>
			</tr>
			<xsl:apply-templates select="sp:ConsigneeDetails" mode="org"/>
		</xsl:if>
		<tr>
			<td class="bordered">
				Порт погрузки:<br/>
				<xsl:value-of select="sp:LoadingLocationDetails"/>
			</td>
			<td class="bordred">
				Признак выгрузки<br/>
				<xsl:apply-templates select="sp:UnloadingIndicator" mode="indicator"/>
			</td>
			<td class="bordered">
				Порт выгрузки: 
				<xsl:value-of select="sp:UnLoadingLocationDetails"/>
			</td>
			<td class="bordered">
				Порт первоначальной погрузки:<br/>
				<xsl:value-of select="sp:FactLocationDepartureDetails"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="4">
				ТО назначения: 
				<xsl:apply-templates select="sp:DestinationCustomsOfficeDetails" mode="comma"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="4">
				Сведения о контейнере: 
				<xsl:for-each select="sp:ContainerDetails">
					<xsl:if test="position() &gt; 1">; </xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:if test="sp:SealDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Сведения о средствах идентификации</td>
			</tr>
			<xsl:apply-templates select="sp:SealDetails"/>
		</xsl:if>
		
		<xsl:if test="sp:PITransitTransportMeansDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Сведения о транспортных средствах</td>
			</tr>
			<xsl:apply-templates select="sp:PITransitTransportMeansDetails"/>
		</xsl:if>
		
		<xsl:if test="sp:TransitTerminationDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">
					Сведения о предполагаемом ТО и пункте назначения
				</td>
			</tr>
			<xsl:apply-templates select="sp:TransitTerminationDetails"/>
		</xsl:if>
		
		<xsl:apply-templates select="sp:PITranshipmentDetails"/>
		
		<xsl:if test="sp:UnloadWarehouseDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Сведения о планируемом месте временного хранения</td>
			</tr>
			<xsl:apply-templates select="sp:UnloadWarehouseDetails"/>
		</xsl:if>
		
		<xsl:apply-templates select="sp:GoodsItem"/>
		
		<xsl:apply-templates select="sp:TransitGuaranteeDetails"/>
		
		<xsl:if test="sp:TransitDeclarantDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Декларант таможенной процедуры таможенного транзита</td>
			</tr>
			<xsl:apply-templates select="sp:TransitDeclarantDetails" mode="org"/>
		</xsl:if>
		
		<xsl:if test="sp:UnionCarrierDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Перевозчик товаров по таможенной территории Евразийского экономического союза</td>
			</tr>
			<xsl:apply-templates select="sp:UnionCarrierDetails" mode="org"/>
		</xsl:if>
		
		<xsl:if test="sp:RailwayStampDetails">
			<tr>
				<td class="bordered" style="background-color: #eee;">Сведения из календарного штемпеля железнодорожной станции</td>
				<td class="bordered" colspan="3">
					<xsl:apply-templates select="sp:RailwayStampDetails" mode="spaced"/>
				</td>
			</tr>
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template match="sp:TransitGuaranteeDetails">
		<tr class="title">
			<td class="bordered" colspan="4"  style="font-style:oblique;background-color:#ccc;">Сведения о мере обеспечения соблюдения таможенного транзита</td>
		</tr>
		<tr>
			<td class="bordered">
				Код меры обеспечения<br/>
				<xsl:value-of select="catpi_ru:MeasureCode"/>
			</td>
			<td class="bordered">
				Сумма обеспечения (для РБ)<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeAmount" mode="spaced"/>
			</td>
			<td class="bordered">
				Сведения о рег.номере сертификата обеспечения<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeCertificateIdDetails" mode="regnum"/>
			</td>
			<td class="bordered">
				Документ, подтверждающий применение<br/>
				<xsl:apply-templates select="catpi_ru:TransitGuaranteeDocDetails" mode="doc"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код вида гарантии<br/>
				<xsl:value-of select="catpi_ru:NationalGuaranteeCode"/>
			</td>
			<td class="bordered">
				Код страны<br/>
				<xsl:for-each select="catpi_ru:NonGuaranteeCountryCode">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Документ о включении в реестр<br/>
				<xsl:apply-templates select="catpi_ru:RegisterDocumentIdDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Наименование гаранта<br/>
				<xsl:value-of select="catpi_ru:GuaranteeName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				УНП<br/>
				<xsl:value-of select="catpi_ru:UNP"/>
			</td>
			<td class="bordered">
				Код МФО/БИК<br/>
				<xsl:value-of select="catpi_ru:BIC"/>
			</td>
			<td class="bordered">
				Поручительство<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeTD" mode="doc"/>
			</td>
			<td class="bordered">
				Адрес гаранта:<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeAddress" mode="comma"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="sp:GoodsItem">
		<tr class="title">
			<td class="bordered" colspan="4"  style="font-style:oblique;background-color:#ccc;">Сведения о товаре <xsl:value-of select="catpi_ru:GoodsNumeric"/></td>
		</tr>
		<tr>
			<td class="bordered">
				Код ТН ВЭД<br/>
				<xsl:value-of select="catpi_ru:GoodsTNVEDCode"/>
			</td>
			<td class="bordered">
				Описание:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
			</td>
			<td class="bordered">
				Вес брутто (кг)<br/>
				<xsl:value-of select="catpi_ru:GrossWeightQuantity"/>
			</td>
			<td class="bordered">
				Вес нетто (кг)<br/>
				<xsl:value-of select="catpi_ru:NetWeightQuantity"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Кол-во в ДЕИ:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsMeasureQuantity" mode="quantity"/>
			</td>
			<td class="bordered">
				Номер товара в ТД:<br/>
				<xsl:for-each select="catpi_ru:DTConsignmentItemOrdinal">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Признак продукции военного назначения:<br/>
				<xsl:apply-templates select="catpi_ru:MilitaryProducts" mode="indicator"/>
			</td>
			<td class="bordered">
				Кол-во товара в ЕИ, отличной от основной и ДЕИ:<br/>
				<xsl:for-each select="catpi_ru:AddGoodsMeasureQuantity">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:apply-templates select="." mode="quantity"/>
				</xsl:for-each>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Места происхождения:<br/>
				<xsl:for-each select="catpi_ru:ProductionPlaceName">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Описание маркировки:<br/>
				<xsl:value-of select="catpi_ru:GoodsLabelDescription"/>
			</td>
			<td class="bordered">
				Назначение области применения:<br/>
				<xsl:value-of select="catpi_ru:GoodsUsageDescription"/>
			</td>
			<td class="bordered"></td>
		</tr>
		
		<xsl:for-each select="catpi_ru:Manufacturer">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;">Производитель</td>
			</tr>
			<xsl:apply-templates select="." mode="org"/>
		</xsl:for-each>
		
		<xsl:if test="catpi_ru:VetReleaseOrganizationDetails">
			<tr>
				<td class="bordered">Сведения о предприятии, выпустившем в оборот товары, подлежащие ветеринарному контролю</td>
				<td class="bordered" colspan="3">
					<xsl:for-each select="catpi_ru:VetReleaseOrganizationDetails">
						<xsl:if test="position() &gt; 1"><br/></xsl:if>
						<xsl:apply-templates select="." mode="comma"/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="catpi_ru:CargoPackagePalletDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;">Сведения о грузе, грузовых местах, поддонах и упаковке товаров</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:CargoPackagePalletDetails"/>
		</xsl:if>
		
		<tr>
			<td class="bordered">
				Номера контейнеров:<br/>
				<xsl:for-each select="catpi_ru:PIContainerDetails">
					<xsl:if test="position() &gt; 1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Страна происхождения:<br/>
				<xsl:apply-templates select="catpi_ru:OriginCountryDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Стоимость (цена)<br/>
				<xsl:apply-templates select="catpi_ru:CAValueAmount" mode="spaced"/>
			</td>
			<td class="bordered">
				Предшествующий документ:<br/>
				<xsl:for-each select="catpi_ru:PIPrecedingDocDetails">
					<xsl:if test="position() &gt; 1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
		</tr>
		
		<xsl:if test="catpi_ru:PIGoodsDocDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;">Доп. информация</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:PIGoodsDocDetails"/>
		</xsl:if>
		
		<xsl:if test="catpi_ru:PIShipmentLocationDetails">
			<tr>
				<td class="bordered">Сведения о месте и дате отгрузки товара</td>
				<td class="bordered" colspan="3">
					<xsl:apply-templates select="catpi_ru:PIShipmentLocationDetails" mode="comma"/>
				</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="sp:UNDGClassId">
			<tr>
				<td class="bordered">Класс опасного груза</td>
				<td class="bordered" colspan="3"><xsl:value-of select="sp:UNDGClassId"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="sp:UNDGNumberId">
			<tr>
				<td class="bordered">Номер опасного груза</td>
				<td class="bordered" colspan="3"><xsl:value-of select="sp:UNDGNumberId"/></td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="catpi_ru:PIGoodsDocDetails">
		<tr>
			<td class="bordered" style="background-color: #ddd;">
				Документ:<br/>
				<xsl:apply-templates select="." mode="doc"/>
			</td>
			<td class="bordered">
				Действует с:<br/>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="RUScat_ru:DocStartDate"/></xsl:call-template>
			</td>
			<td class="bordered">
				Действует по:<br/>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="RUScat_ru:DocValidityDate"/></xsl:call-template>
			</td>
			<td class="bordered">
				Код страны<br/>
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код вида док-та<br/>
				<xsl:value-of select="catpi_ru:DocKindCode"/>
			</td>
			<td class="bordered">
				Орган гос.власти:<br/>
				<xsl:value-of select="catpi_ru:AuthorityName"/>
			</td>
			<td class="bordered">
				ИД органа:<br/>
				<xsl:value-of select="catpi_ru:AuthorityId"/>
			</td>
			<td class="bordered">
				Типографский № бланка:<br/>
				<xsl:value-of select="catpi_ru:FormNumberId"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Учетная серия корма:<br/>
				<xsl:value-of select="catpi_ru:RegistrationSeriesId"/>
			</td>
			<td class="bordered">
				Код товара по ТН ВЭД:<br/>
				<xsl:value-of select="catpi_ru:TnvedCode"/>
			</td>
			<td class="bordered">
				Торг. наименование:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsDescription" mode="spaced"/>
			</td>
			<td class="bordered">
				Описание маркировки:<br/>
				<xsl:value-of select="catpi_ru:GoodsLabelDescription"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:GoodsDisinfectionDetails">
			<tr>
				<td class="bordered" colspan="4" style="font-style: oblique;">Обеззараживание</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:GoodsDisinfectionDetails"/>
			
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="catpi_ru:GoodsDisinfectionDetails">
		<tr>
			<td class="bordered" colspan="4">
				Проведено:<br/>
				<xsl:apply-templates select="catpi_ru:DisinfectionIndicator" mode="indicator"/>
			</td>
		</tr>
		<xsl:apply-templates select="catpi_ru:DisinfectionDetails"/>
	</xsl:template>
	
	<xsl:template match="catpi_ru:DisinfectionDetails">
		<tr>
			<td class="bordered">
				Дата проведения:<br/>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="catpi_ru:EventDate"/></xsl:call-template>
			</td>
			<td class="bordered">
				Продолжительность:<br/>
				<xsl:value-of select="catpi_ru:ExpositionDuration"/>
			</td>
			<td class="bordered">
				Способ обработки:<br/>
				<xsl:value-of select="catpi_ru:DisinfectionMethodName"/>
			</td>
			<td class="bordered">
				Химикат:<br/>
				<xsl:value-of select="catpi_ru:ChemicalName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Температура:<br/>
				<xsl:value-of select="catpi_ru:TemperatureMeasure"/>
			</td>
			<td class="bordered">
				Концентрация:<br/>
				<xsl:apply-templates select="catpi_ru:ConcentrationMeasure" mode="quantity"/>
			</td>
			<td class="bordered">
				Доза:<br/>
				<xsl:apply-templates select="catpi_ru:DoseMeasure" mode="quantity"/>
			</td>
			<td class="bordered">
				Доп.информация:<br/>
				<xsl:value-of select="catpi_ru:DescriptionText"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="catpi_ru:CargoPackagePalletDetails">
		<tr>
			<td class="bordered">
				Общее кол-во грузовых мест<br/>
				<xsl:value-of select="catpi_ru:PakageQuantity"/>
			</td>
			<td class="bordered">
				Код наличия упаковки<br/>
				<xsl:value-of select="catpi_ru:PakageTypeCode"/>
			</td>
			<td class="bordered">
				Кол-во частично занятых гр.мест<br/>
				<xsl:value-of select="catpi_ru:PakagePartQuantity"/>
			</td>
			<td class="bordered">
				Вид грузовых мест<br/>
				<xsl:value-of select="catpi_ru:PakageKindName"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:PackagePalleteInformation">
			<tr>
				<td class="bordered" colspan="4" style="font-style: oblique;">Сведения о грузе, таре, упаковке, поддоне</td>
			</tr>
			<tr>
				<td class="bordered">Код информации, код вида</td>
				<td class="bordered">Кол-во</td>
				<td class="bordered" colspan="2">Описание</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:PackagePalleteInformation"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="catpi_ru:PackagePalleteInformation">
		<tr>
				<td class="bordered">
					<xsl:value-of select="catpi_ru:InfoKindCode"/>
					<xsl:if test="catpi_ru:InfoKindCode and catpi_ru:PalleteCode">
						<xsl:text> / </xsl:text>
					</xsl:if>
					<xsl:value-of select="catpi_ru:PalleteCode"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="catpi_ru:PalleteQuantity"/>
				</td>
				<td class="bordered" colspan="2">
					<xsl:apply-templates select="catpi_ru:CargoDescriptionText"/>
				</td>
			</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:value-of select="catpi_ru:GoodsQuantity|RUScat_ru:MeasuredAmount|cat_ru:GoodsQuantity"/>
		<xsl:if test="catpi_ru:MeasureUnitQualifierName|RUScat_ru:MeasureUnitQualifierName|cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="catpi_ru:MeasureUnitQualifierName|RUScat_ru:MeasureUnitQualifierName|cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="catpi_ru:MeasureUnitQualifierCode|RUScat_ru:MeasureUnitQualifierCode|cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="catpi_ru:MeasureUnitQualifierCode|RUScat_ru:MeasureUnitQualifierCode|cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="sp:UnloadWarehouseDetails">
		<tr>
			<td class="bordered">
				Код<br/>
				<xsl:value-of select="catpi_ru:InformationTypeCode"/>
			</td>
			<td class="bordered">
				Наименование<br/>
				<xsl:value-of select="catpi_ru:PlaceName"/>
			</td>
			<td class="bordered">
				Дата<br/>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="catpi_ru:WarehouseDate"/></xsl:call-template>
			</td>
			<td class="bordered">
				Особые условия<br/>
				<xsl:apply-templates select="catpi_ru:StorageRequirementDetails"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Документ:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsLocationDocDetails" mode="comma"/>
			</td>
			<td class="bordered" colspan="2">
				Доп.сведения о документе:<br/>
				<xsl:apply-templates select="catpi_ru:RegisterDocumentIdDetails" mode="comma"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="catpi_ru:StorageRequirementDetails">
		<xsl:apply-templates select="catpi_ru:SpecialStorageRequirementIndicator" mode="indicator"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="catpi_ru:Description"/>
	</xsl:template>
	
	<xsl:template match="sp:PITranshipmentDetails">
		<tr class="title">
			<td class="bordered" colspan="4" style="font-style: oblique; background-color:#ccc;">
				Планируемая грузовая операция <xsl:value-of select="position()"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код вида<br/>
				<xsl:value-of select="catpi_ru:CargoOperationKindCode"/>
			</td>
			<td class="bordered">
				Признак перегрузки товаров:<br/>
				<xsl:apply-templates select="catpi_ru:ContainerIndicator" mode="indicator"/>
			</td>
			<td class="bordered">
				Код страны: <br/>
				<xsl:value-of select="catpi_ru:CountryCode"/>
			</td>
			<td class="bordered">
				Страна<br/>
				<xsl:value-of select="catpi_ru:CountryName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Место:<br/>
				<xsl:value-of select="catpi_ru:PlaceName"/>
			</td>
			<td class="bordered">
				ТО<br/>
				<xsl:apply-templates select="catpi_ru:CustomsOfficeDetails" mode="comma"/>
			</td>
			<td class="bordered">
				№ нового контейнера:<br/>
				<xsl:for-each select="catpi_ru:ContainerNumber">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Описание:<br/>
				<xsl:value-of select="catpi_ru:Description"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:TranshipmentTransportDetails">
			<tr>
				<td class="bordered" colspan="4">Сведения о новом ТС</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:TranshipmentTransportDetails"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="catpi_ru:TranshipmentTransportDetails">
		<tr>
			<td class="bordered">
				Код вида<br/>
				<xsl:value-of select="catpi_ru:TransporKind"/>
			</td>
			<td class="bordered">
				Код страны<br/>
				<xsl:value-of select="catpi_ru:CountryCode"/>
			</td>
			<td class="bordered">
				Кол-во ТС:
				<xsl:value-of select="catpi_ru:TransportMeansQuantity"/>
			</td>
			<td class="bordered"></td>
		</tr>
		<xsl:if test="catpi_ru:TransportMeansRegistrationId">
			<tr class="title">
				<td class="bordered part" colspan="4">
					Сведения о ТС
				</td>
			</tr>
			<tr>
				<td class="bordered" colspan="4">
					<table>
						<tbody>
							<tr>
								<td class="bordered">ID</td>
								<td class="bordered">Страна</td>
								<td class="bordered">VIN</td>
								<td class="bordered">Код вида</td>
								<td class="bordered">Код марки</td>
								<td class="bordered">Свидетельство</td>
							</tr>
							<xsl:apply-templates select="catpi_ru:TransportMeansRegistrationId"/>
						</tbody>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="sp:TransitTerminationDetails">
		<tr>
			<td class="bordered" colspan="2">
				ТО:<br/>
				<xsl:apply-templates select="catpi_ru:CustomsOfficeDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Номер ЗТК: <br/>
				<xsl:value-of select="catpi_ru:CustomsControlZoneId"/>
			</td>
			<td class="bordered">
				Cвидетельство: <br/>
				<xsl:apply-templates select="catpi_ru:RegisterDocumentIdDetails" mode="comma"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:SubjectAddressDetails">
			<tr>
				<td class="bordered" colspan="4">
					Адрес УЭО:<br/>
				</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:SubjectAddressDetails" mode="address"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="sp:PITransitTransportMeansDetails">
		<tr>
			<td class="bordered">
				Признак совпадения ТС:<br/>
				<xsl:apply-templates select="catpi_ru:EqualIndicator" mode="indicator"/>
			</td>
			<td class="bordered">
				Код вида ТС:<br/>
				<xsl:value-of select="catpi_ru:TransporKind"/>
			</td>
			<td class="bordered">
				Количество:<br/>
				<xsl:value-of select="catpi_ru:TransportMeansQuantity"/>
			</td>
			<td class="bordered"></td>
		</tr>
		<xsl:if test="catpi_ru:TransportMeansRegistrationId">
			<tr class="title">
				<td class="bordered part" colspan="4">
					Сведения о ТС
				</td>
			</tr>
			<tr>
				<td class="bordered" colspan="4">
					<table>
						<tbody>
							<tr>
								<td class="bordered">ID</td>
								<td class="bordered">Страна</td>
								<td class="bordered">VIN</td>
								<td class="bordered">Код вида</td>
								<td class="bordered">Код марки</td>
								<td class="bordered">Свидетельство</td>
							</tr>
							<xsl:apply-templates select="catpi_ru:TransportMeansRegistrationId"/>
						</tbody>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="catpi_ru:TransportMeansRegistrationId">
		<tr>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:TransportIdentifier"/>
				<xsl:if test="catpi_ru:TrailerIdentifier">
					<xsl:text>/</xsl:text>
					<xsl:value-of select="catpi_ru:TrailerIdentifier"/>
				</xsl:if>
				<xsl:if test="catpi_ru:SecondTrailerIdentifier">
					<xsl:text>/</xsl:text>
					<xsl:value-of select="catpi_ru:SecondTrailerIdentifier"/>
				</xsl:if>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:TransportMeansNationalityCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:VINID"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:TransportModeCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:TransportMarkCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:DocID"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="indicator">
		<xsl:choose>
			<xsl:when test=". = 1 or . = 'true'">есть</xsl:when>
			<xsl:otherwise>нет</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="indicator_yn">
		<xsl:choose>
			<xsl:when test=". = 1 or . = 'true'">да</xsl:when>
			<xsl:otherwise>нет</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="sp:SealDetails">
		<tr>
			<td class="bordered">
				Количество:<br/>
				<xsl:value-of select="catpi_ru:SealQuantity"/>
			</td>
			<td class="bordered">
				ID пломбиратора:<br/>
				<xsl:for-each select="catpi_ru:SealNumber">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				ID пломбы:<br/>
				<xsl:for-each select="catpi_ru:SealId">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Описание:<br/>
				<xsl:apply-templates select="catpi_ru:SealDescriptionText"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:value-of select="cat_ru:PrDocumentName|catpi_ru:GeneralDocName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber|catpi_ru:GeneralNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate|catpi_ru:GeneralDate"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="sp:BorderTransportDetails">
		<tr>
			<td class="bordered">
				Код вида<br/>
				<xsl:value-of select="sp:TransportModeCode"/>
			</td>
			<td class="bordered">
				Кол-во<br/>
				<xsl:value-of select="sp:TransportMeansQuantity"/>
			</td>
			<td class="bordered">
				Признак контейнернах перевозок:<br/>
				<xsl:choose>
					<xsl:when test="sp:ContainerIndicator = 0 or sp:ContainerIndicator = 'false'">товары перевозятся не в контейнере</xsl:when>
					<xsl:when test="sp:ContainerIndicator = 1 or sp:ContainerIndicator = 'true'">товары перевозятся в контейнере</xsl:when>
				</xsl:choose>
			</td>
			<td class="bordered">
				Наименование судна<br/>
				<xsl:value-of select="sp:ShipName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код страны принадлежности<br/>
				<xsl:value-of select="sp:NationalityCode"/>
			</td>
			<td class="bordered">
				ИМО номер:<br/>
				<xsl:value-of select="sp:ShipIMONumber"/>
			</td>
			<td class="bordered">
				Тип судна:<br/>
				<xsl:value-of select="sp:ShipType"/>
			</td>
			<td class="bordered">
				Брутто регистровый тоннаж:<br/>
				<xsl:apply-templates select="sp:GrossTonnage" mode="quantity"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Сведения о регистрации судна:<br/>
				<xsl:apply-templates select="sp:ShipDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Номер рейса<br/>
				<xsl:value-of select="sp:VoyageId"/>
			</td>
			<td class="bordered">
				Маршрут<br/>
				<xsl:for-each select="sp:RouteDetails">
					<xsl:if test="position() &gt; 1">; </xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Код цели ввоза<br/>
				<xsl:value-of select="sp:TransportMeansEntryPurpose"/>
			</td>
		</tr>

		<tr>
			<td class="bordered" colspan="4">
				Капитан<br/>
				<xsl:apply-templates select="sp:Captain" mode="spaced"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Кол-во членов экипажа<br/>
				<xsl:value-of select="sp:CrewQuantity"/>
			</td>
			<td class="bordered" colspan="2">
				Кол-во пассажиров<br/>
				<xsl:value-of select="sp:PassengerQuantity"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Сведения о членах экипажа<br/>
				<xsl:for-each select="sp:CrewMemberDetails">
					<xsl:if test="position() &gt; 1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
			<td class="bordered" colspan="2">
				Сведения о пассажирах<br/>
				<xsl:for-each select="sp:PassengerDetails">
					<xsl:if test="position() &gt; 1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
		</tr>

		<xsl:if test="sp:OperatorDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Эксплуaтант</td>
			</tr>
			<xsl:apply-templates select="sp:OperatorDetails" mode="org"/>
		</xsl:if>	
		
	</xsl:template>

	<xsl:template match="*" mode="org">
		<!--tr>
			<td class="bordered" colspan="4" style="border-top:2px solid gray;"></td>
		</tr-->
		<tr>
			<td class="bordered" colspan="4">Наименование организации / ФИО физического лица 
				<xsl:value-of select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
					<xsl:value-of select="cat_ru:ShortName"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="bordered">Сведения об организации</td>
			<td class="bordered" colspan="3">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
				<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
				<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			</td>
		</tr>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<tr>
				<td class="bordered" colspan="2">Кодовое обозначение страны</td>
				<td class="bordered" colspan="2"><xsl:value-of select="RUScat_ru:CountryA2Code"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<tr>
				<td class="bordered" colspan="2">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode" mode="spaced"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<tr>
				<td class="bordered" colspan="2">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<tr>
				<td class="bordered" colspan="2">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="RUScat_ru:UITN" mode="spaced"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<tr>
				<td class="bordered" colspan="2">Уникальный идентификатор физического лица</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="RUScat_ru:PersonId"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="catpi_ru:EqualIndicator">
			<tr>
				<td class="bordered" colspan="2">Признак совпадения лица, представившего предварительную информацию, с перевозчиком, осуществляющим ввоз товаров на таможенную территорию Евразийского экономического союза</td>
				<td class="bordered" colspan="2">
					<xsl:choose>
						<xsl:when test="catpi_ru:EqualIndicator=0 or catpi_ru:EqualIndicator='false'">не совпадают</xsl:when>
						<xsl:when test="catpi_ru:EqualIndicator=1 or catpi_ru:EqualIndicator='true'">совпадают</xsl:when>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="sp:AirlineId">
			<tr>
				<td class="bordered" colspan="2">Идентификатор авиакомпании, присвоенный Международной ассоциацией воздушного транспорта</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="sp:AirlineId"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<tr class="title">
				<td class="bordered part" colspan="4">Сведения о документе, удостоверяющем личность физического лица</td>
			</tr>
			<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Адрес</td>
			</tr>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Контакты</td>
			</tr>
			<xsl:apply-templates select="RUScat_ru:CommunicationDetails" mode="contacts"/>
		</xsl:if>
		<xsl:if test="catpi_ru:RegisterDocumentIdDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Свидетельство о включении лица в реестр таможенных представителей</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:RegisterDocumentIdDetails" mode="certif"/>
		</xsl:if>
		<!--tr>
			<td class="bordered" colspan="4" style="border-top:2px solid gray;"></td>
		</tr-->
	</xsl:template>
	
	<xsl:template match="*" mode="certif">
		<tr>
			<td class="bordered">
				Код страны<br/>
				<xsl:value-of select="RUScat_ru:CountryA2Code"/>
			</td>
			<td class="bordered">
				Рег. номер<br/>
				<xsl:value-of select="RUScat_ru:RegistrationNumberId"/>
			</td>
			<td class="bordered">
				Признак перерегистрации<br/>
				<xsl:value-of select="RUScat_ru:ReregistrationCode"/>
			</td>
			<td class="bordered">
				Код типа<br/>
				<xsl:value-of select="RUScat_ru:AEORegistryKindCode"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="contacts">
		<tr>
			<td class="bordered">
				Телефон<br/>
				<xsl:for-each select="cat_ru:Phone">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Факс<br/>
				<xsl:value-of select="cat_ru:Fax"/>
			</td>
			<td class="bordered">
				Телекс<br/>
				<xsl:value-of select="cat_ru:Telex"/>
			</td>
			<td class="bordered">
				E-mail<br/>
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<tr>
					<td class="bordered" colspan="4">
						<i><xsl:value-of select="position()"/></i>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:AddressText"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<tr>
					<td class="bordered">
						<i><xsl:value-of select="position()"/></i>
						<br/>
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode=1">адрес регистрации</xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode=2">фактический адрес</xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode=3">почтовый адрес</xsl:when>
						</xsl:choose>
					</td>
					<td class="bordered">
						Индекс<br/>
						<xsl:value-of select="RUScat_ru:PostalCode"/>
					</td>
					<td class="bordered">
						Страна<br/>
						<xsl:value-of select="RUScat_ru:CountryCode"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:CounryName"/>
					</td>
					<td class="bordered">
						Регион<br/>
						<xsl:value-of select="RUScat_ru:Region"/>
					</td>
				</tr>
				<tr>
					<td class="bordered">
						Район<br/>
						<xsl:value-of select="RUScat_ru:District"/>
					</td>
					<td class="bordered">
						Город, населенный пункт<br/>
						<xsl:value-of select="RUScat_ru:Town"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:City"/>
					</td>
					<td class="bordered">
						Улица, дом, квартира<br/>
						<xsl:value-of select="RUScat_ru:StreetHouse"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:House"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:Room"/>
					</td>
					<td class="bordered">
						ОКАТО<br/>
						<xsl:value-of select="RUScat_ru:OKATO"/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:template>
	
	<xsl:template match="*" mode="identityCard">
		<tr>
			<td class="bordered">Серия<br/>
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			</td>
			<td class="bordered">Номер<br/>
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</td>
			<td class="bordered">Дата выдачи<br/>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/></xsl:call-template>
			</td>
			<td class="bordered">Кем выдан<br/>
				<xsl:value-of select="RUScat_ru:OrganizationName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="identityCard_line" >
		<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/></xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:OrganizationName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:IssuerCode"/>
	</xsl:template>
	
	<xsl:template match="*" mode="comma">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="spaced">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
				</xsl:when>
				<xsl:when test="contains(local-name(.), 'Identity')">
					<xsl:apply-templates select="." mode="identityCard_line"/>
				</xsl:when>
				<xsl:when test="count(./*) != 0">
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
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
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
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
	<xsl:template match="cat_ru:RKOrganizationFeatures| RUScat_ru:RKOrganizationFeatures">
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
	
	<xsl:template match="sp:EntryCheckPointDetails">
		<tr>
			<td class="bordered" colspan="2" width="50%">
				Код ТО<br/>
				<xsl:value-of select="sp:CustomsOfficeCode"/>
			</td>
			<td class="bordered" colspan="2" width="50%">
				Аэропорт<br/>
				<xsl:value-of select="sp:PortCode"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="regnum">
		<xsl:value-of select="catpi_ru:CountryCode|cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date"><xsl:with-param name="dateIn" select="catpi_ru:Date|cat_ru:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="catpi_ru:PINumber|cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
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
