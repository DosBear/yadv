<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ifa="urn:customs.ru:Information:CustomsDocuments:InfFromActInspection:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Сведения из акта таможенного досмотра (осмотра)</title>
            <style type="text/css">
                    body{background: #CCCCCC; font-size: 10pt; counter-reset: pageCounter;}
                    div.page {
                        width: 210mm;
                        margin: auto;
                        padding: 5mm 10mm 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                        margin-top: 20px;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                    h1 {font-size: 13pt; text-align: center; margin-top: 0; margin-bottom: 3px;}
                    table {border-collapse: collapse;}
                    table.items {border: 1px solid black; width: 100%;}
                    table.items td {border: 1px solid black; padding: 2px; text-align: center;}
                    table.items td.noborder {border:none;}
                    table.items td.fieldName {border:none; width: 1%; white-space: nowrap; padding-left: 10px; text-align: left;}
                    table.items td.field {border:none; border-bottom: 1px solid black; min-width: 60px; font-weight: bold;}
                    table.items td.smallValue {min-width: 13px; max-width: 13px; font-weight: bold;}
                    table.items td.small {font-size: 8pt; border-top: none;}
                    table.noBorderTop {border-top: none;}
                    table.items td.noBorderTop {border-top: none;}
                    table.items td.noBorderTop {border-top: none;}
                    table.items td.small {border-bottom: none;}
                    table.items td.left {text-align: left;}
                    div.pageNum {float: right;}
                    div.pageNum:after{
                        content: "Страница " counter(pageCounter);
                        counter-increment: pageCounter;
                    }
                    span.headerSmall {font-size: 10pt;}
                </style>
         </head>
         <body>
            <xsl:apply-templates select="//catESAD_ru:AutoInspResults"/>
         </body>
      </html>
   </xsl:template>
   <!--Корневой элемент-->
   <xsl:template match="catESAD_ru:AutoInspResults">
      <div class="page">
         <h1>
                В результате таможенного досмотра автомобиля<br/>
                (товарная позиция 8702, 8703 по ТН ВЭД ЕАЭС) установлено следующее:
            </h1>
         <table class="items">
            <tr>
               <td class="fieldName">Марка а/м</td>
               <td class="field">
                  <xsl:apply-templates select="catESAD_ru:Mark"/>
               </td>
               <td class="fieldName">Модель а/м</td>
               <td class="field">
                  <xsl:apply-templates select="catESAD_ru:Model"/>
               </td>
               <td class="fieldName"/>
               <td class="small"/>
               <xsl:call-template name="numberedCell">
                  <xsl:with-param name="count" select="6"/>
               </xsl:call-template>
               <td class="small"/>
            </tr>
            <tr>
               <td class="fieldName" rowspan="2">Год выпуска</td>
               <td class="field">
                  <xsl:apply-templates select="catESAD_ru:ProductionYear"/>
               </td>
               <td class="fieldName" colspan="3" rowspan="2"/>
               <td class="center noBorderTop" rowspan="2">Пробег</td>
               <td class="smallValue" rowspan="2">
                  <xsl:value-of select="floor(catESAD_ru:Distance div 100000)"/>
               </td>
               <td class="smallValue" rowspan="2">
                  <xsl:value-of select="floor(catESAD_ru:Distance div 10000) - 10 * floor(catESAD_ru:Distance div 100000)"/>
               </td>
               <td class="smallValue" rowspan="2">
                  <xsl:value-of select="floor(catESAD_ru:Distance div 1000) - 10 * floor(catESAD_ru:Distance div 10000)"/>
               </td>
               <td class="smallValue" rowspan="2">
                  <xsl:value-of select="floor(catESAD_ru:Distance div 100) - 10 * floor(catESAD_ru:Distance div 1000)"/>
               </td>
               <td class="smallValue" rowspan="2">
                  <xsl:value-of select="floor(catESAD_ru:Distance div 10) - 10 * floor(catESAD_ru:Distance div 100)"/>
               </td>
               <td class="smallValue" rowspan="2">
                  <xsl:value-of select="floor(catESAD_ru:Distance div 1) - 10 * floor(catESAD_ru:Distance div 10)"/>
               </td>
               <td class="center noBorderTop" rowspan="2">км/миль</td>
            </tr>
            <tr>
               <td class="fieldName"/>
            </tr>
         </table>
         <table class="items noBorderTop">
            <tr>
               <td class="small" style="border-bottom: none;"/>
               <xsl:call-template name="numberedCell">
                  <xsl:with-param name="count" select="17"/>
               </xsl:call-template>
               <td class="fieldName">Двигатель №</td>
               <td class="field">
                  <xsl:apply-templates select="catESAD_ru:EngineNumber"/>
               </td>
            </tr>
            <tr>
               <td class="center noBorderTop" rowspan="2">VIN</td>
               <xsl:call-template name="charInSeparateCell">
                  <xsl:with-param name="count" select="17"/>
                  <xsl:with-param name="string" select="catESAD_ru:VIN"/>
               </xsl:call-template>
               <td class="fieldName">Кузов №</td>
               <td class="field">
                  <xsl:apply-templates select="catESAD_ru:CarriageNumber"/>
               </td>
            </tr>
            <tr>
               <td class="noborder" colspan="2"/>
            </tr>
         </table>
         <table class="items noBorderTop">
            <tr>
               <td class="fieldName">Уровень радиационного фона составляет:</td>
               <td class="field"/>
               <td class="fieldName">Измерения проводились прибором:</td>
               <td class="field"/>
               <td class="fieldName">№:</td>
               <td class="field"/>
               <td class="fieldName"/>
            </tr>
            <tr>
               <td class="noborder" colspan="7"/>
            </tr>
         </table>
         <table class="items noBorderTop">
            <tr>
               <td class="noBorderTop"/>
               <td class="noBorderTop">Характеристики и комплектация</td>
               <td class="noBorderTop">имеется в наличии</td>
               <td class="noBorderTop">отсутствует</td>
            </tr>
            <tr>
               <td>1</td>
               <td class="left">Тип автомобиля</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:AutoKind"/>
               </td>
            </tr>
            <tr>
               <td>2</td>
               <td class="left">Тип кузова/количество дверей</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:BodyInf/catESAD_ru:BodyKind"/>
                  <xsl:text>/</xsl:text>
                  <xsl:apply-templates select="catESAD_ru:BodyInf/catESAD_ru:DoorsNumber"/>
               </td>
            </tr>
            <tr>
               <td>3</td>
               <td class="left">Тип двигателя (бензин/дизель/прочие)</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:EngineKind"/>
               </td>
            </tr>
            <tr>
               <td>4</td>
               <td class="left">Рабочий объем (из документов) (куб. см)</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:EngineVolume"/>
               </td>
            </tr>
            <tr>
               <td>5</td>
               <td class="left">Цвет автомобиля</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:Color"/>
               </td>
            </tr>
            <tr>
               <td>6</td>
               <td class="left">Трансмиссия (мех./авто)/комбинир./пониж. передача</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:Transmission"/>
               </td>
            </tr>
            <tr>
               <td>7</td>
               <td class="left">Колесная формула ([ведущие] х [всего])</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:NumberOfDriveWheel"/>
                  <xsl:text> x </xsl:text>
                  <xsl:apply-templates select="catESAD_ru:NumberOfWheel"/>
               </td>
            </tr>
            <tr>
               <td>8</td>
               <td class="left">Колесные диски из легкого сплава (шт. есть/нет)</td>
               <xsl:apply-templates mode="countableOption" select="catESAD_ru:LightDisk"/>
            </tr>
            <tr>
               <td>9</td>
               <td class="left">Гидроусилитель руля (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:GUR"/>
            </tr>
            <tr>
               <td>10</td>
               <td class="left">Подушки безопасности (шт. есть/нет)</td>
               <xsl:apply-templates mode="countableOption" select="catESAD_ru:AirBag"/>
            </tr>
            <tr>
               <td>11</td>
               <td class="left">Электростеклоподъемники (шт. есть/нет)</td>
               <xsl:apply-templates mode="countableOption" select="catESAD_ru:ElGlassLift"/>
            </tr>
            <tr>
               <td>12</td>
               <td class="left">Электропривод зеркал заднего вида (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:ElBackGlass"/>
            </tr>
            <tr>
               <td>13</td>
               <td class="left">Электроподогрев лобового стекла (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:ElHeatingGlass"/>
            </tr>
            <tr>
               <td>14</td>
               <td class="left">Кондиционер/климат-контроль</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:Conditioner"/>
            </tr>
            <tr>
               <td>15</td>
               <td class="left">Обивка салона (материал)</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:Upholstery"/>
               </td>
            </tr>
            <tr>
               <td>16</td>
               <td class="left">Светотехнические приборы (описать в дополнительном листе)</td>
               <td colspan="2">
                  <xsl:if test="count(catESAD_ru:SvetDevice) > 0">
                     <i>См. на доп. листе</i>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td>17</td>
               <td class="left">Радиоаппаратура (есть (описать в дополнительном листе) есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:RadioDevice"/>
            </tr>
            <tr>
               <td>18</td>
               <td class="left">Люк в крыше (мех./электро шт./нет) (описать в доп. листе)</td>
               <xsl:apply-templates mode="countableOption" select="catESAD_ru:NumberOfHatch"/>
            </tr>
            <tr>
               <td>18</td>
               <td class="left">Люк в крыше (мех./электро шт./нет) (описать в доп. листе)</td>
               <xsl:apply-templates mode="countableOption" select="catESAD_ru:NumberOfHatch"/>
            </tr>
            <tr>
               <td>19</td>
               <td class="left">Подогрев сидений (шт. есть/нет)</td>
               <xsl:apply-templates mode="countableOption" select="catESAD_ru:SeatHeating"/>
            </tr>
            <tr>
               <td>20</td>
               <td class="left">Телефон (шт. есть/нет)</td>
               <xsl:apply-templates mode="countableOption" select="catESAD_ru:Telefon"/>
            </tr>
            <tr>
               <td>21</td>
               <td class="left">Центральный замок (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:CentrLock"/>
            </tr>
            <tr>
               <td>22</td>
               <td class="left">Окна в салоне (шт. есть/нет) (для микроавтобуса)</td>
               <xsl:apply-templates mode="countableOption" select="catESAD_ru:SalonWindow"/>
               <xsl:if test="count(catESAD_ru:SalonWindow) = 0">
                  <xsl:call-template name="uncountableOption">
                     <xsl:with-param name="selectYes" select="0"/>
                  </xsl:call-template>
               </xsl:if>
            </tr>
            <tr>
               <td>23</td>
               <td class="left">Количество мест</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:NumberOfSeat"/>
               </td>
            </tr>
            <tr>
               <td>24</td>
               <td class="left">Система поддержания допустимой дистанции (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:DistanceControl"/>
            </tr>
            <tr>
               <td>25</td>
               <td class="left">Электронная система парковки (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:Parktronic"/>
            </tr>
            <tr>
               <td>26</td>
               <td class="left">Огнетушитель (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:FireExten"/>
            </tr>
            <tr>
               <td>27</td>
               <td class="left">Система отопления во время стоянки (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:ParkHeating"/>
            </tr>
            <tr>
               <td>28</td>
               <td class="left">Антиблокировочная система (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:ABS"/>
            </tr>
            <tr>
               <td>29</td>
               <td class="left">Бортовой компьютер с дисплеем (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:BortComputer"/>
            </tr>
            <tr>
               <td>30</td>
               <td class="left">Сигнализация (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:Signalization"/>
            </tr>
            <tr>
               <td>31</td>
               <td class="left">Пневмоподвеска (есть/нет)</td>
               <xsl:apply-templates mode="uncountableOption" select="catESAD_ru:PnevmoDevice"/>
            </tr>
            <tr>
               <td>32</td>
               <td class="left">Навесное оборудование (описать в дополнительном листе)</td>
               <xsl:call-template name="uncountableOption">
                  <xsl:with-param name="selectYes" select="count(catESAD_ru:AddonDevice)"/>
               </xsl:call-template>
            </tr>
            <tr>
               <td>33</td>
               <td class="left">Тюнинг: наименование (описать в дополнительном листе)</td>
               <xsl:call-template name="uncountableOption">
                  <xsl:with-param name="selectYes" select="count(catESAD_ru:Tuning)"/>
               </xsl:call-template>
            </tr>
            <tr>
               <td>34</td>
               <td class="left">Наличие бронезащиты и ее класс (по результату экспертизы)</td>
               <xsl:apply-templates mode="countableOption" select="catESAD_ru:BroneClass"/>
            </tr>
            <tr>
               <td>35</td>
               <td class="left">Видимые повреждения (описать в дополнительном листе)</td>
               <xsl:call-template name="uncountableOption">
                  <xsl:with-param name="selectYes" select="count(catESAD_ru:VisDamage)"/>
               </xsl:call-template>
            </tr>
            <tr>
               <td>36</td>
               <td class="left">Регистрационный знак</td>
               <td colspan="2">
                  <xsl:apply-templates select="catESAD_ru:RegCode"/>
               </td>
            </tr>
            <tr>
               <td>37</td>
               <td class="left">Прочее (описать в дополнительном листе)</td>
               <td colspan="2">
                  <xsl:if test="count(catESAD_ru:Other) > 0">
                     <i>См. на доп. листе</i>
                  </xsl:if>
               </td>
            </tr>
         </table>
         <p>
            <xsl:text>Прибытие: [</xsl:text>
            <xsl:choose>
               <xsl:when test="../catESAD_ru:ArriveType = 1">X</xsl:when>
               <xsl:otherwise>
                  <xsl:text> </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:text>] - своим ходом; [</xsl:text>
            <xsl:choose>
               <xsl:when test="../catESAD_ru:ArriveType = 2">X</xsl:when>
               <xsl:otherwise>
                  <xsl:text> </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:text>] - на транспортном средстве; [</xsl:text>
            <xsl:choose>
               <xsl:when test="../catESAD_ru:ArriveType = 3">X</xsl:when>
               <xsl:otherwise>
                  <xsl:text> </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:text>] - в контейнере.</xsl:text>
         </p>
         <xsl:apply-templates select="//ifa:VEDParticipantShortInf"/>
         <xsl:call-template name="pageNum"/>
      </div>
      <xsl:if test="count(catESAD_ru:SvetDevice | catESAD_ru:RadioDeviceDescr | catESAD_ru:Hatch |          catESAD_ru:AddonDevice | catESAD_ru:Tuning | catESAD_ru:VisDamage | catESAD_ru:Other) > 0">
         <div class="page">
            <xsl:call-template name="addInfoPage"/>
         </div>
      </xsl:if>
   </xsl:template>
   <xsl:template name="addInfoPage">
      <h1>
            Дополнительный лист
            <br/>
         <span class="headerSmall">
            <xsl:text>к результатам осмотра автомобиля с VIN: </xsl:text>
            <xsl:apply-templates select="catESAD_ru:VIN"/>
         </span>
      </h1>
      <xsl:if test="catESAD_ru:SvetDevice">
         <p>Светотехнические приборы:</p>
         <ul>
            <xsl:apply-templates mode="additionalInfo" select="catESAD_ru:SvetDevice"/>
         </ul>
      </xsl:if>
      <xsl:if test="catESAD_ru:RadioDeviceDescr">
         <p>Радиоаппаратура :</p>
         <ul>
            <xsl:apply-templates mode="additionalInfo" select="catESAD_ru:RadioDeviceDescr"/>
         </ul>
      </xsl:if>
      <xsl:if test="catESAD_ru:Hatch">
         <p>Люк в крыше:</p>
         <ul>
            <xsl:apply-templates mode="additionalInfo" select="catESAD_ru:Hatch"/>
         </ul>
      </xsl:if>
      <xsl:if test="catESAD_ru:AddonDevice">
         <p>Навесное оборудование:</p>
         <ul>
            <xsl:apply-templates mode="additionalInfo" select="catESAD_ru:AddonDevice"/>
         </ul>
      </xsl:if>
      <xsl:if test="catESAD_ru:Tuning">
         <p>Тюнинг:</p>
         <ul>
            <xsl:apply-templates mode="additionalInfo" select="catESAD_ru:Tuning"/>
         </ul>
      </xsl:if>
      <xsl:if test="catESAD_ru:VisDamage">
         <p>Видимые повреждения:</p>
         <ul>
            <xsl:apply-templates mode="additionalInfo" select="catESAD_ru:VisDamage"/>
         </ul>
      </xsl:if>
      <xsl:if test="catESAD_ru:Other">
         <p>Прочее:</p>
         <ul>
            <xsl:apply-templates mode="additionalInfo" select="catESAD_ru:Other"/>
         </ul>
      </xsl:if>
      <xsl:call-template name="pageNum"/>
   </xsl:template>
   <!--Перечисляет записи дополнительной информации в виде ненумерованного списка-->
   <xsl:template match="*" mode="additionalInfo">
      <li>
         <xsl:apply-templates select="."/>
      </li>
   </xsl:template>
   <!--Описание люка-->
   <xsl:template match="catESAD_ru:Hatch">
      <xsl:text>Тип: </xsl:text>
      <xsl:apply-templates select="catESAD_ru:HatchKind"/>
      <xsl:text>. Описание: </xsl:text>
      <xsl:apply-templates select="catESAD_ru:HatchDescription"/>
   </xsl:template>
   <!--Тип люка-->
   <xsl:template match="catESAD_ru:HatchKind">
      <xsl:choose>
         <xsl:when test=". = 0">механический</xsl:when>
         <xsl:otherwise>электрический</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Номер страницы-->
   <xsl:template name="pageNum">
      <div class="pageNum"/>
   </xsl:template>
   <!--Информация об участнике ВЭД-->
   <xsl:template match="ifa:VEDParticipantShortInf">
      <!--Смысл выводить что-либо есть только в случае, если хотя бы одно поле этой "информации" указано-->
      <xsl:if test="count(*) > 0">
         <p>
            <xsl:text>Информация об участнике ВЭД:</xsl:text>
            <xsl:apply-templates/>
         </p>
      </xsl:if>
   </xsl:template>
   <xsl:template match="ifa:INNID">
      <br/>
      <xsl:text>ИНН: </xsl:text>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="ifa:KPPCode">
      <br/>
      <xsl:text>КПП: </xsl:text>
      <xsl:value-of select="."/>
   </xsl:template>
   <!--Опция автомобиля, которая может быть или не быть-->
   <xsl:template match="*" mode="uncountableOption" name="uncountableOption">
      <xsl:param name="selectYes" select="-1"/>
      <xsl:variable name="doSelectYes">
         <xsl:choose>
            <xsl:when test="$selectYes > 0">1</xsl:when>
            <xsl:when test="$selectYes = 0">0</xsl:when>
            <xsl:when test=". = 0">0</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <td class="center">
         <xsl:text>[</xsl:text>
         <xsl:choose>
            <xsl:when test="$doSelectYes = 0">
               <xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>
               <xsl:text>X</xsl:text>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:text>]</xsl:text>
      </td>
      <xsl:call-template name="disabledOption">
         <xsl:with-param name="selectYes" select="$doSelectYes"/>
      </xsl:call-template>
   </xsl:template>
   <!--Опция автомобиля, которая может быть или не быть и если она есть, нужно указать количество-->
   <xsl:template match="*" mode="countableOption">
      <td class="center">
         <xsl:text>[</xsl:text>
         <xsl:choose>
            <xsl:when test=". = 0">
               <xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:text>]</xsl:text>
      </td>
      <xsl:call-template name="disabledOption">
         <xsl:with-param name="selectYes" select=". != 0"/>
      </xsl:call-template>
   </xsl:template>
   <!--Клетка, соответствующая столбцу "отсутствует" для опции-->
   <xsl:template name="disabledOption">
      <xsl:param name="selectYes"/>
      <td class="center">
         <xsl:text>[</xsl:text>
         <xsl:choose>
            <xsl:when test="$selectYes = 0">
               <xsl:text>X</xsl:text>
            </xsl:when>
            <xsl:otherwise>
               <xsl:text> </xsl:text>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:text>]</xsl:text>
      </td>
   </xsl:template>
   <!--Тип двигателя-->
   <xsl:template match="catESAD_ru:EngineKind">
      <xsl:choose>
         <xsl:when test=". = 0">бензин</xsl:when>
         <xsl:when test=". = 1">дизель</xsl:when>
         <xsl:when test=". = 2">прочее</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="."/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Трансмиссия автомобиля-->
   <xsl:template match="catESAD_ru:Transmission">
      <xsl:choose>
         <xsl:when test=". = 1">автоматическая</xsl:when>
         <xsl:when test=". = 2">механическая</xsl:when>
         <xsl:when test=". = 3">вариатор</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="."/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Рекурсивный вызов этого шаблона приводит к появлению требуемого числа пронумерованных ячеек таблицы-->
   <xsl:template name="numberedCell">
      <!--Требуемое количество нумерованных ячеек-->
      <xsl:param name="count"/>
      <!--Номер текущей ячейки-->
      <xsl:param name="iteration" select="1"/>
      <xsl:if test="$count >= $iteration">
         <td class="smallValue small">
            <xsl:value-of select="$iteration"/>
         </td>
         <xsl:call-template name="numberedCell">
            <xsl:with-param name="count" select="$count"/>
            <xsl:with-param name="iteration" select="$iteration + 1"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <!--Рекурсивный вызов этого шаблона приводит к выводу каждого символа строки в отдельной ячейке таблицы-->
   <xsl:template name="charInSeparateCell">
      <!--Требуемое количество ячеек-->
      <xsl:param name="count"/>
      <!--Номер текущей ячейки-->
      <xsl:param name="iteration" select="1"/>
      <xsl:param name="string"/>
      <xsl:if test="$count >= $iteration">
         <td class="smallValue" rowspan="2">
            <xsl:value-of select="substring($string, $iteration, 1)"/>
         </td>
         <xsl:call-template name="charInSeparateCell">
            <xsl:with-param name="count" select="$count"/>
            <xsl:with-param name="iteration" select="$iteration + 1"/>
            <xsl:with-param name="string" select="$string"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
