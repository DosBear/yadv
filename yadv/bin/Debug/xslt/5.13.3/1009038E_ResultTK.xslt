<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rstk="urn:customs.ru:Information:SQDocuments:ResultTK:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="rstk:ResultTK">
      <html>
         <head>
            <title>Сведения из реестра транспортного контроля</title>
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
					padding-left: 20mm;
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
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
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
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-family: Arial, serif;
				}
				
				.auxiliary tbody tr td {
					border: 0;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Сведения из реестра транспортного контроля</h2>
               <!--Данные транспортного контроля/инспекции-->
               <xsl:for-each select="rstk:Inspection">
                  <span class="header">
                     <xsl:value-of select="position()"/>.
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						Данные транспортного контроля/инспекции <br/>
                  </span>
                  <xsl:apply-templates select="."/>
               </xsl:for-each>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="rstk:Inspection">
      <!-- Запись с коммент в правом углу Дата / время принятия решения -->
      <div align="right">
         <table border="0" style="margin-top:-25px; width:60mm">
            <tbody>
               <tr>
                  <td align="center" style="border-right:0; border-left:0; border-top:0">
                     <xsl:call-template name="date_time">
                        <xsl:with-param name="dateTimeIn" select="rstk:InspectionDateTime"/>
                     </xsl:call-template>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="low" style="border:0;">(Дата, время инспекции)</td>
               </tr>
            </tbody>
         </table>
      </div>
      <span>Идентификатор инспекции/транспортного контроля: <xsl:value-of select="rstk:InspectionID"/>
      </span>
      <br/>
      <span>Идентификатор инструментального контроля: <xsl:value-of select="rstk:InstrumentalControlID"/>
      </span>
      <br/>
      <span>Идентификатор документального контроля: <xsl:value-of select="rstk:DocumentalControlID"/>
      </span>
      <br/>
      <span>Идентификатор листа контроля: <xsl:value-of select="rstk:ViolationControlID"/>
      </span>
      <br/>
      <span>Идентификатор белорусского контроля: <xsl:value-of select="rstk:BelarusControlID"/>
      </span>
      <br/>
      <span>Идентификатор казахстанского контроля: <xsl:value-of select="rstk:KazakhControlID"/>
      </span>
      <br/>
      <span>Решение, принятое по результатам контроля: <xsl:value-of select="rstk:DecisionName"/>
      </span>
      <br/>
      <span>
		Дата/время окончания транспортного контроля: 
		<xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="rstk:EndDateTime"/>
         </xsl:call-template>
      </span>
      <br/>
      <xsl:if test="rstk:Information">
         <table border="0" class="auxiliary" style="margin-top:10px">
            <tbody>
               <tr>
                  <td class="low" style="width:45mm">Примечание инспектора. </td>
                  <td align="left" class="low">
                     <xsl:value-of select="rstk:Information"/>
                  </td>
               </tr>
            </tbody>
         </table>
         <br/>
      </xsl:if>
      <br/>
      <span class="header">Пост, где осуществлялся транспортный контроль:</span>
      <br/>
      <xsl:apply-templates select="rstk:CheckPoint"/>
      <!--	<br/><span class="header">Перевозчик</span><br/>
	<xsl:apply-templates select="rstk:Carrier"/><br/>-->
      <xsl:if test="rstk:IsInstrumental = 'true' or rstk:IsInstrumental = 't' or rstk:IsInstrumental = 1 or rstk:InstrumentalControl">
         <span class="header">Инструментальный контроль</span>
         <br/>
		Проведен<br/>
         <xsl:choose>
            <xsl:when test="rstk:InstrumentalControl">
               <xsl:apply-templates select="rstk:InstrumentalControl"/>
            </xsl:when>
            <xsl:otherwise>Сведения об инструментальном контроле отсутствуют<br/>
            </xsl:otherwise>
         </xsl:choose>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:IsVisual = 'true' or rstk:IsVisual = 't' or rstk:IsVisual = 1 or rstk:VisualControl">
         <span class="header">Визуальный контроль</span>
         <br/>
		Проведен <br/>
         <xsl:choose>
            <xsl:when test="rstk:VisualControl">
               <xsl:apply-templates select="rstk:VisualControl"/>
            </xsl:when>
            <xsl:otherwise>Сведения о визуальном контроле отсутствуют<br/>
            </xsl:otherwise>
         </xsl:choose>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:IsDocumental = 'true' or rstk:IsDocumental = 't' or rstk:IsDocumental = 1 ">
         <span class="header">Документальный контроль</span>
         <br/>
		Проведен   <xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="rstk:DocumentalControl/rstk:StartDateTime"/>
         </xsl:call-template>
         <br/>
         <xsl:choose>
            <xsl:when test="rstk:DocumentalControl">
               <xsl:apply-templates select="rstk:DocumentalControl"/>
            </xsl:when>
            <xsl:otherwise>Сведения о документальном контроле отсутствуют<br/>
            </xsl:otherwise>
         </xsl:choose>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:Violation">
         <span class="header">Выявленные в контроле нарушения:</span>
         <br/>
         <xsl:for-each select="rstk:Violation">
            <xsl:value-of select="position()"/>.
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:BelarusControl">
         <br/>
         <span class="header">Сведения из листа транспортного контроля Республики Беларусь:</span>
         <br/>
         <xsl:apply-templates select="rstk:BelarusControl"/>
      </xsl:if>
      <xsl:if test="rstk:KazakhControl">
         <br/>
         <span class="header">Сведения из листа транспортного контроля Республики Казахстан:</span>
         <br/>
         <xsl:apply-templates select="rstk:KazakhControl"/>
      </xsl:if>
      <xsl:if test="rstk:NotifDocument">
         <br/>
         <span class="header">Сведения из уведомления:</span>
         <br/>
         <table border="1">
            <tbody>
               <tr>
                  <td>Идентификатор уведомления</td>
                  <td>Номер уведомления</td>
                  <td>Код страны</td>
                  <td>Контрольный пункт, в который необходимо предоставить документы</td>
                  <td>Водитель</td>
                  <td>Инспектор, выдавший уведомление</td>
               </tr>
               <xsl:apply-templates select="rstk:NotifDocument"/>
            </tbody>
         </table>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rstk:CheckPoint">
KFKFKF
	<span>
         <xsl:choose>
            <xsl:when test="rstk:CheckPointName">
               <xsl:value-of select="rstk:CheckPointName"/> 
				(Код поста (пункта пропуска) - <xsl:value-of select="rstk:CheckPointCode"/>
               <xsl:if test="rstk:CountryCode">
						, код государства - <xsl:value-of select="rstk:CountryCode"/>
               </xsl:if>)
			</xsl:when>
            <xsl:otherwise>
				Код поста (пункта пропуска) - <xsl:value-of select="rstk:CheckPointCode"/>
               <xsl:if test="rstk:CountryCode">
					, код государства - <xsl:value-of select="rstk:CountryCode"/>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
      </span>
      <br/>
   </xsl:template>
   <xsl:template match="rstk:Customs">
      <span>
         <xsl:choose>
            <xsl:when test="cat_ru:OfficeName">
               <xsl:value-of select="cat_ru:OfficeName"/> 
				(код ТО - <xsl:value-of select="cat_ru:Code"/>
               <xsl:if test="cat_ru:CustomsCountryCode">
						, код государства - <xsl:value-of select="cat_ru:CustomsCountryCode"/>
               </xsl:if>)
			</xsl:when>
            <xsl:otherwise>
				код ТО - <xsl:value-of select="cat_ru:Code"/>
               <xsl:if test="cat_ru:CustomsCountryCode">
					, код государства - <xsl:value-of select="cat_ru:CustomsCountryCode"/>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
      </span>
      <br/>
   </xsl:template>
   <xsl:template match="rstk:InstrumentalControl">
	Сведения из инструментального контроля:<br/>
      <table border="1">
         <tbody>
            <tr>
               <td style="width:50%">Номер листа учета</td>
               <td>
                  <xsl:value-of select="rstk:Number"/>
               </td>
            </tr>
            <tr>
               <td>Дата/время начала инструментального контроля</td>
               <td>
                  <xsl:call-template name="date_time">
                     <xsl:with-param name="dateTimeIn" select="rstk:DateTime"/>
                  </xsl:call-template>
               </td>
            </tr>
            <xsl:if test="rstk:PassNumber">
               <tr>
                  <td>Номер талона контроля</td>
                  <td>
                     <xsl:value-of select="rstk:PassNumber"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstk:Course">
               <tr>
                  <td>Шифр поездки</td>
                  <td>
                     <xsl:value-of select="rstk:Course"/>
                  </td>
               </tr>
            </xsl:if>
            <tr>
               <td>Инспектор, проводивший инструментальный контроль</td>
               <td>
                  <xsl:apply-templates select="rstk:InstrumentalEmployee"/>
               </td>
            </tr>
            <tr>
               <td>Весовые параметра ТС</td>
               <td>
                  <xsl:apply-templates select="rstk:Weight"/>
               </td>
            </tr>
            <tr>
               <td>Габаритные параметры ТС</td>
               <td>
                  <xsl:apply-templates select="rstk:Size"/>
               </td>
            </tr>
            <tr>
               <td>Регистрационные данные ТС</td>
               <td>
                  <xsl:apply-templates select="rstk:Auto"/>
               </td>
            </tr>
            <tr>
               <td>Соответствие дымности (токсичности) / уровню шумности</td>
               <td>
                  <xsl:for-each select="rstk:ViolSmokeNoise">
                     <xsl:value-of select="position()"/>
                     <xsl:text disable-output-escaping="yes"/>
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
               </td>
            </tr>
            <xsl:if test="rstk:PassWeight">
               <tr>
                  <td>МСВТС</td>
                  <td>
                     <xsl:apply-templates select="rstk:PassWeight"/>
                  </td>
               </tr>
            </xsl:if>
         </tbody>
      </table>
   </xsl:template>
   <!--<xsl:template match="rstk:InstrumentalEmployee | rstk:DocumentalEmployee">
	-->
   <!--<xsl:value-of select="cat_ru:PersonSurname"/>
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	<xsl:value-of select="cat_ru:PersonName"/>
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	<xsl:value-of select="cat_ru:PersonMiddleName"/>,
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	должность - <xsl:value-of select="cat_ru:PersonPost"/>-->
   <!--
	<xsl:value-of select="cat_ru:PersonName"/><xsl:if test="cat_ru:LNP">&#160;<xsl:value-of select="cat_ru:LNP"/></xsl:if>
</xsl:template>-->
   <xsl:template match="rstk:Weight">
      <xsl:if test="rstk:Pin">
		Список нагрузок на каждую ось: <br/>
         <xsl:for-each select="rstk:Pin">
            <xsl:value-of select="."/>,
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </xsl:for-each>
         <br/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:Total">Суммарная нагрузка на оси <xsl:value-of select="rstk:Total"/>
         <br/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:PinCount">Количество осей ТС <xsl:value-of select="rstk:PinCount"/>
         <br/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:Distance">
		Список расстояний между осями, м: <br/>
         <xsl:for-each select="rstk:Distance">
            <xsl:value-of select="."/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </xsl:for-each>
         <br/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:Cargo">
		Вес груза, т: <xsl:value-of select="rstk:Cargo"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rstk:Size">
      <xsl:if test="rstk:Height">
		Высота ТС, м : <xsl:value-of select="rstk:Height"/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:Width">
		Ширина ТС, м : <xsl:value-of select="rstk:Width"/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:Length">
		Длина ТС, м : <xsl:value-of select="rstk:Length"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rstk:Auto">
      <xsl:if test="cat_ru:VIN">Номер шасси <xsl:value-of select="cat_ru:VIN"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportKindCode">Код типа ТС <xsl:value-of select="cat_ru:TransportKindCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportMarkCode">Код марки ТС <xsl:value-of select="cat_ru:TransportMarkCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportIdentifier">Идентификатор ТС <xsl:value-of select="cat_ru:TransportIdentifier"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportMeansNationalityCode">Код страны принадлежности ТС <xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:ActiveTransportIdentifier">Идентификатор активного ТС  <xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportRegNumber">Номер свидетельства о регистрации ТС <xsl:value-of select="cat_ru:TransportRegNumber"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="rstk:ViolSmokeNoise | rstk:ViolFidelNumbTrail | rstk:Requirement | rstk:Suitability">
      <xsl:if test="rstk:RequirementInfo">Требование/условие <xsl:value-of select="rstk:RequirementInfo"/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:ViolationName">Нарушение <xsl:value-of select="rstk:ViolationName"/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:ControlStatusName">Статус <xsl:value-of select="rstk:ControlStatusName"/>
         <br/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rstk:PassWeight | rstk:PassTG | rstk:PassKG | rstk:PassOG | rstk:PassSPS | rstk:TransitPermit | rstk:TransitPermit | rstk:RoadCheck | rstk:PenaltyCheck | rstk:Certificate | rstk:Resolution ">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <br/>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
      <xsl:if test="rstk:ControlStatusName">
         <span>Статус </span>
         <xsl:value-of select="rstk:ControlStatusName"/>
      </xsl:if>
      <xsl:if test="rstk:Sum">
		Сумма дорожных сборов/штрафа  
		<xsl:value-of select="rstk:Sum"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rstk:VisualControl">
	Сведения из визуального контроля:<br/>
      <table>
         <tbody>
            <tr>
               <td style="width:50%">Вид перевозки</td>
               <td>
                  <xsl:value-of select="rstk:ShipmentType"/>
               </td>
            </tr>
            <tr>
               <td>Вид поездки</td>
               <td>
                  <xsl:value-of select="rstk:TripKind"/>
               </td>
            </tr>
            <xsl:if test="rstk:IsTG or rstk:IsKG or rstk:IsOG or rstk:IsSPS or rstk:IsTG">
               <tr>
                  <td>Вид груза</td>
                  <td>
                     <xsl:if test="rstk:IsTG = 'true' or rstk:IsTG = 't' or rstk:IsTG = 1 ">Тяжеловесный груз<br/>
                     </xsl:if>
                     <xsl:if test="rstk:IsKG = 'true' or rstk:IsKG = 't' or rstk:IsKG = 1 ">Крупногабаритный груз<br/>
                     </xsl:if>
                     <xsl:if test="rstk:IsOG = 'true' or rstk:IsOG = 't' or rstk:IsOG = 1 ">Опасный груз<br/>
                     </xsl:if>
                     <xsl:if test="rstk:IsSPS = 'true' or rstk:IsSPS = 't' or rstk:IsSPS = 1 ">Скоропортящийся груз<br/>
                     </xsl:if>
                     <xsl:if test="rstk:IsTG = 'true' or rstk:IsTG = 't' or rstk:IsTG = 1 ">Тяжеловесный груз<br/>
                     </xsl:if>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstk:IsMAP = 'true' or rstk:IsMAP = 't' or rstk:IsMAP = 1">
               <tr>
                  <td>Вид перевозки</td>
                  <td>Международная автомобильная перевозка</td>
               </tr>
            </xsl:if>
            <xsl:if test="rstk:PassengerCount">
               <tr>
                  <td>Количество пассажирова</td>
                  <td>
                     <xsl:value-of select="rstk:PassengerCount"/>
                  </td>
               </tr>
            </xsl:if>
            <tr>
               <td>Транзитная поездка</td>
               <td>
                  <xsl:choose>
                     <xsl:when test="rstk:IsTransit = 'true' or rstk:IsTransit = 't' or rstk:IsTransit = 1">Да</xsl:when>
                     <xsl:otherwise>Нет</xsl:otherwise>
                  </xsl:choose>
               </td>
            </tr>
            <xsl:if test="rstk:CargoTypeName">
               <tr>
                  <td>Код ТН ВЭД</td>
                  <td>
                     <xsl:value-of select="rstk:CargoTypeName"/>
                  </td>
               </tr>
            </xsl:if>
            <tr>
               <td>Регистрационные данные первого прицепа</td>
               <td>
                  <xsl:apply-templates select="rstk:Trailer"/>
               </td>
            </tr>
            <xsl:if test="rstk:Requirement">
               <tr>
                  <td>Сведения о наличии/соответствии/выполнении требования/условия</td>
                  <td>
                     <xsl:apply-templates select="rstk:Requirement"/>
                  </td>
               </tr>
            </xsl:if>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="rstk:Trailer">
      <xsl:if test="cat_ru:VIN">Номер шасси <xsl:value-of select="cat_ru:VIN"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportKindCode">Код типа ТС <xsl:value-of select="cat_ru:TransportKindCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportMarkCode">Код марки ТС <xsl:value-of select="cat_ru:TransportMarkCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportIdentifier">Идентификатор ТС <xsl:value-of select="cat_ru:TransportIdentifier"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportMeansNationalityCode">
		Код страны принадлежности ТС 
		<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:ActiveTransportIdentifier">
		Идентификатор активного ТС  
		<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportRegNumber">
		Номер свидетельства о регистрации ТС 
		<xsl:value-of select="cat_ru:TransportRegNumber"/>
      </xsl:if>
      <br/>
      <br/>
      <span>Наличие и соответствие отличительного знака страны регистрации прицепа/полуприцепа установленным требованиям: </span>
      <br/>
      <xsl:apply-templates select="rstk:ViolFidelNumbTrail"/>
   </xsl:template>
   <xsl:template match="rstk:DocumentalControl">
	Сведения из документального контроля<br/>
      <table>
         <tbody>
            <xsl:if test="rstk:AccountCode">
               <tr>
                  <td style="width:50%">Номер учетного талона</td>
                  <td>
                     <xsl:value-of select="rstk:AccountCode"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstk:NumberUNO">
               <tr>
                  <td>Номер/код опасного груза по ООН</td>
                  <td>
                     <xsl:value-of select="rstk:NumberUNO"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstk:MassTSFull">
               <tr>
                  <td>Полная масса ТС / состава ТС, тонн</td>
                  <td>
                     <xsl:value-of select="rstk:MassTSFull"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstk:DangerClass">
               <tr>
                  <td>Грузоподъемность</td>
                  <td>
                     <xsl:choose>
                        <xsl:when test="rstk:IsRoadPayment = '1' ">больше 3.5 тонн</xsl:when>
                        <xsl:otherwise>меньше 3.5 тонн</xsl:otherwise>
                     </xsl:choose>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstk:DangerClass">
               <tr>
                  <td>Класс опасного груза</td>
                  <td>
                     <xsl:value-of select="rstk:DangerClass"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstk:DangerClass">
               <tr>
                  <td>Оплата дорожного сбора </td>
                  <td>
                     <xsl:choose>
                        <xsl:when test="rstk:IsRoadPayed = 'true' or rstk:IsRoadPayed = 't' or rstk:IsRoadPayed = '1' ">Да</xsl:when>
                        <xsl:otherwise>Нет</xsl:otherwise>
                     </xsl:choose>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstk:DocumentalEmployee">
               <tr>
                  <td>Инспектор, проводивший инструментальный контроль</td>
                  <td>
                     <xsl:apply-templates select="rstk:DocumentalEmployee"/>
                  </td>
               </tr>
            </xsl:if>
            <tr>
               <td>Водитель</td>
               <td>
                  <xsl:apply-templates select="rstk:FirstDriver"/>
               </td>
            </tr>
            <tr>
               <td>Сведения о соответствии/выполнении требованию/условия</td>
               <td>
                  <xsl:apply-templates select="rstk:Requirement"/>
               </td>
            </tr>
            <tr>
               <td>Перевозчик</td>
               <td>
                  <xsl:apply-templates select="rstk:Carrier"/>
               </td>
            </tr>
            <tr>
               <td>Отправитель</td>
               <td>
                  <xsl:apply-templates select="rstk:Consignor"/>
               </td>
            </tr>
            <tr>
               <td>Получатель</td>
               <td>
                  <xsl:apply-templates select="rstk:Consignee"/>
               </td>
            </tr>
            <!--<tr>
				<td>МСВТС</td>
				<td><xsl:apply-templates select="rstk:PassWeight"/></td>
			</tr>-->
            <tr>
               <td>Наличие разрешения на перевозку ТГ</td>
               <td>
                  <xsl:apply-templates select="rstk:PassTG"/>
               </td>
            </tr>
            <tr>
               <td>Наличие разрешения на перевозку КГ</td>
               <td>
                  <xsl:apply-templates select="rstk:PassKG"/>
               </td>
            </tr>
            <tr>
               <td>Наличие разрешения на перевозку ОГ</td>
               <td>
                  <xsl:apply-templates select="rstk:PassOG"/>
               </td>
            </tr>
            <tr>
               <td>Наличие разрешения на перевозку СПС</td>
               <td>
                  <xsl:apply-templates select="rstk:PassSPS"/>
               </td>
            </tr>
            <tr>
               <td>Карточка допуска</td>
               <td>
                  <xsl:apply-templates select="rstk:PassCard"/>
               </td>
            </tr>
            <tr>
               <td>Лицензионная карточка</td>
               <td>
                  <xsl:apply-templates select="rstk:LicenceCard"/>
               </td>
            </tr>
            <tr>
               <td>Использование разрешения на поездку</td>
               <td>
                  <xsl:apply-templates select="rstk:TransitPermit"/>
               </td>
            </tr>
            <tr>
               <td>Место отправления</td>
               <td>
                  <xsl:apply-templates select="rstk:DispatchLocation"/>
               </td>
            </tr>
            <tr>
               <td>Место назначения</td>
               <td>
                  <xsl:apply-templates select="rstk:DestinationLocation"/>
               </td>
            </tr>
            <xsl:if test="rstk:TahogData">
               <tr>
                  <td>Данные цифрового тахографа</td>
                  <td>
                     <xsl:apply-templates select="rstk:TahogData"/>
                  </td>
               </tr>
            </xsl:if>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="rstk:FirstDriver | rstk:Driver">
      <xsl:value-of select="cat_ru:PersonSurname"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonMiddleName"/>
      <xsl:if test="cat_ru:PersonPost">, должность - <xsl:value-of select="cat_ru:PersonPost"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rstk:Carrier | rstk:Consignor">
      <xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if>
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
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
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
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
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <span class="header">Адрес:</span>
      <br/>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="rstk:PassCard | rstk:LicenceCard">
      <xsl:if test="rstk:PassKind">
         <span>Вид спецразрешения: <xsl:value-of select="rstk:PassKind"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:Number">
         <span>Номер карточки допуска/лицензионной карточки: <xsl:value-of select="rstk:Number"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:ControlStatusNamer">
         <span>Статус проверки карточки допуска/лицензионной карточки: <xsl:value-of select="rstk:ControlStatusName"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:Duration">
		Срок действия: 
		<xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="rstk:Duration"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:LicenceStatusName">
		Статус карточки допуска/лицензионной карточки:  
		<xsl:value-of select="rstk:LicenceStatusName"/>
         <br/>
      </xsl:if>
      <span>Сертификат: <xsl:apply-templates select="rstk:Certificate"/>
      </span>
   </xsl:template>
   <xsl:template match="rstk:DispatchLocation | rstk:DestinationLocation">
      <xsl:choose>
         <xsl:when test="rstk:PlaceName">
            <xsl:value-of select="rstk:PlaceName"/> 
			(код страны - <xsl:value-of select="rstk:CountryCode"/>
            <xsl:if test="rstk:RegionCode">
					, код региона - <xsl:value-of select="rstk:RegionCode"/>
            </xsl:if>)
		</xsl:when>
         <xsl:otherwise>
			код страны - <xsl:value-of select="rstk:CountryCode"/>
            <xsl:if test="rstk:RegionCode">
				, код региона - <xsl:value-of select="rstk:RegionCode"/>
            </xsl:if>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="rstk:TahogData">
      <xsl:if test="rstk:ApprovalDateTime">
		Дата/время официального утверждения: 
		<xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="rstk:ApprovalDateTime"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:TahogInspectDateTime">
		Дата/время последней инспекции:  
		<xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="rstk:TahogInspectDateTime"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:DriveDuration">
		Продолжительность управления ТС за предыдущий период: 
		<xsl:value-of select="rstk:DriveDuration"/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:DriveDurationWeek">
		Продолжительность управления ТС за предыдущую неделю: 
		<xsl:value-of select="rstk:DriveDurationWeek"/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:RestDuration">
		Продолжительность отдыха за предыдущие сутки: 
		<xsl:value-of select="rstk:RestDuration"/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:RestDurationWeek">
		Продолжительность отдыха за предыдущую неделю: 
		<xsl:value-of select="rstk:RestDurationWeek"/>
         <br/>
      </xsl:if>
      <xsl:if test="rstk:BreakDuration">
		Продолжительность перерывов в течение смены: 
		<xsl:value-of select="rstk:BreakDuration"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rstk:BelarusControl | rstk:KazakhControl">
      <table>
         <xsl:if test="rstk:IsTG or rstk:IsKG or rstk:IsOG">
            <tr>
               <td style="width:50%">Вид груза</td>
               <td>
                  <xsl:if test="rstk:IsTG = 'true' or rstk:IsTG = 't' or rstk:IsTG = 1 ">Тяжеловесный груз<br/>
                  </xsl:if>
                  <xsl:if test="rstk:IsKG = 'true' or rstk:IsKG = 't' or rstk:IsKG = 1 ">Крупногабаритный груз<br/>
                  </xsl:if>
                  <xsl:if test="rstk:IsOG = 'true' or rstk:IsOG = 't' or rstk:IsOG = 1 ">Опасный груз<br/>
                  </xsl:if>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:AccountCode">
            <tr>
               <td>Номер учетного талона</td>
               <td>
                  <xsl:value-of select="rstk:AccountCode"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:PermitSeries">
            <tr>
               <td>Серия разрешения</td>
               <td>
                  <xsl:value-of select="rstk:PermitSeries"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:Currency">
            <tr>
               <td>Валюта</td>
               <td>
                  <xsl:value-of select="rstk:Currency"/>
               </td>
            </tr>
         </xsl:if>
         <tr>
            <td>Разрешение на поездку</td>
            <td>
               <xsl:apply-templates select="rstk:TransitPermit"/>
            </td>
         </tr>
         <xsl:if test="rstk:RoadCheck">
            <tr>
               <td>Квитанция об оплате дорожных сборов</td>
               <td>
                  <xsl:apply-templates select="rstk:RoadCheck"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:PenaltyCheck">
            <tr>
               <td>Квитанция об оплате штрафа</td>
               <td>
                  <xsl:apply-templates select="rstk:PenaltyCheck"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:Resolution">
            <tr>
               <td>Постановление</td>
               <td>
                  <xsl:apply-templates select="rstk:Resolution"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:Suitability">
            <tr>
               <td>Наличие разрешений/документов об оплате/соответствие параметрам, указанным в разрешении</td>
               <td>
                  <xsl:apply-templates select="rstk:Suitability"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:PassTG">
            <tr>
               <td>Разрешение на перевозку ТГ</td>
               <td>
                  <xsl:apply-templates select="rstk:PassTG"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:PassKG">
            <tr>
               <td>Разрешение на перевозку КГ</td>
               <td>
                  <xsl:apply-templates select="rstk:PassKG"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:PassOG">
            <tr>
               <td>Разрешение на перевозку ОГ</td>
               <td>
                  <xsl:apply-templates select="rstk:PassOG"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="rstk:PassOG">
            <tr>
               <td>Разрешение на перевозку ОГ</td>
               <td>
                  <xsl:apply-templates select="rstk:PassOG"/>
               </td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <xsl:template match="rstk:NotifDocument">
      <tr>
         <td>
            <xsl:value-of select="rstk:NotifID"/>
         </td>
         <td>
            <xsl:value-of select="rstk:NotifNumber"/>
         </td>
         <td>
            <xsl:value-of select="rstk:CountryCode"/>
         </td>
         <td>
            <xsl:apply-templates select="rstk:Customs"/>
         </td>
         <td style="width: 25mm">
            <xsl:apply-templates select="rstk:Driver"/>
         </td>
         <td>
            <xsl:apply-templates select="rstk:CustomsPerson"/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="rstk:CustomsPerson | rstk:InstrumentalEmployee | rstk:DocumentalEmployee">
      <span>Ф.И.О. <xsl:value-of select="cat_ru:PersonName"/>
      </span>
      <br/>
      <xsl:if test="cat_ru:LNP">
         <span>ЛНП <xsl:value-of select="cat_ru:LNP"/>
         </span>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
