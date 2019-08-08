<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:shmf="urn:customs.ru:Information:TransportDocuments:Car:ShippingManifest:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <title>Путевой лист грузового автомобиля</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                        counter-reset: count_h3;
                    }

                    div.pageAlbum {
                        width: 297mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    h2 {
                        text-align: center;
                    }

                    h3:before {
                        content: counter(count_h3) ". ";
                        counter-increment: count_h3;
                    }

                    h3 {
                        text-align: left;
                        counter-reset: count_h4;
                        margin-top: 5pt;
                        margin-bottom: 5pt;
                    }

                    h4:before {
                        content: counter(count_h3) "." counter(count_h4) ". ";
                        counter-increment: count_h4;
                    }

                    h4 {
                        padding-left: 10pt;
                        margin-top: 0;
                        margin-bottom: 3pt;
                    }

                    .bold {
                        font-weight: bold;
                    }

                    table {
                        border: none;
                        vertical-align: middle;
                    }

                    table.header {
                        margin-left: auto;
                        margin-right: auto;
                    }

                    td.graphUnderline {
                        border-bottom: 1px solid black;
                        text-align: center;
                    }

                    td.graph {
                        font-size: 7pt;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                    }

                    td.graphBefore {
                        text-align: right;
                        white-space: nowrap;
                        padding-right: 5pt;
                    }

                    table.route {
                        border-collapse: collapse;
                    }

                    table.route th {
                        background: #F0F0F0;
                        vertical-align: middle;
                        font-weight: bold;
                        text-align: center;
                        border: 1px solid black;
                    }

                    td.route {
                        padding: 2pt;
                        border: 1px solid black;
                    }

                    p {
                        text-indent: 30pt;
                    }

                    @media print {
                        div.pageAlbum {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <xsl:apply-templates/>
         </body>
      </html>
   </xsl:template>
   <!--Шаблон для отображения даты по стандартам русской локали-->
   <xsl:template name="date">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <xsl:value-of select="substring($text,9,2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($text,6,2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($text,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Шаблон для отображения даты и времени по стандартам русской локали-->
   <xsl:template name="dateTime">
      <xsl:param name="date"/>
      <xsl:param name="time"/>
      <xsl:choose>
         <xsl:when test="substring($date, 5, 1) = '-' and substring($date, 8, 1) = '-'">
            <xsl:value-of select="substring($date,9,2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($date,6,2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($date,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$date"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:text> в </xsl:text>
      <xsl:value-of select="substring($time,1,5)"/>
   </xsl:template>
   <!--Обработка корневого элемента-->
   <xsl:template match="shmf:ShippingManifest">
      <div class="pageAlbum">
         <h2>ПУТЕВОЙ ЛИСТ</h2>
         <table class="header">
            <tr class="bold">
               <td>грузового автомобиля</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:Series"/>
               </td>
               <td>№</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:Number"/>
               </td>
            </tr>
            <tr>
               <td/>
               <td class="graph">(серия)</td>
               <td colspan="2"/>
            </tr>
            <tr class="bold">
               <td class="graphUnderline" colspan="4">
                  <xsl:call-template name="date">
                     <xsl:with-param name="text" select="shmf:Date"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td class="graph" colspan="4">Дата путевого листа</td>
            </tr>
            <tr class="bold">
               <td class="graphUnderline" colspan="4">
                  <xsl:call-template name="date">
                     <xsl:with-param name="text" select="shmf:Expire"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td class="graph" colspan="4">Дата окончания действия путевого листа</td>
            </tr>
         </table>
         <xsl:apply-templates select="shmf:OrganizationCreatedManifest"/>
         <xsl:apply-templates select="shmf:Driver"/>
         <xsl:apply-templates select="shmf:WorkingDay"/>
         <xsl:apply-templates select="shmf:Vehicle"/>
         <xsl:apply-templates select="shmf:Escort"/>
         <xsl:apply-templates mode="Routes" select="/"/>
         <xsl:if test="shmf:Notes">
            <br/>
            <h3>Особые отметки</h3>
            <p>
               <xsl:value-of select="shmf:Notes"/>
            </p>
         </xsl:if>
      </div>
   </xsl:template>
   <!-- Информация об организации -->
   <xsl:template match="shmf:OrganizationCreatedManifest">
      <h3>Организация, выдавшая путевой лист</h3>
      <table>
         <tr>
            <td>Организация</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:Organization/cat_ru:OrganizationName"/>
               <xsl:if test="shmf:Organization/cat_ru:ShortName">
                        (<xsl:value-of select="shmf:Organization/cat_ru:ShortName"/>)
                    </xsl:if>
            </td>
         </tr>
         <xsl:if test="shmf:Organization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
            <tr>
               <td>ОГРН</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:Organization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="shmf:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN">
            <tr>
               <td>ИНН</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="shmf:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
            <tr>
               <td>КПП</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
               </td>
            </tr>
         </xsl:if>
         <tr>
            <td>Адрес</td>
            <td class="graphUnderline">
               <xsl:if test="shmf:Address/cat_ru:PostalCode">
                  <xsl:value-of select="shmf:Address/cat_ru:PostalCode"/>,
                    </xsl:if>
               <xsl:if test="shmf:Address/cat_ru:CounryName">
                  <xsl:value-of select="shmf:Address/cat_ru:CounryName"/>
                  <xsl:if test="shmf:Address/cat_ru:CountryCode">(<xsl:value-of select="shmf:Address/cat_ru:CountryCode"/>)
                        </xsl:if>
                        ,
                    </xsl:if>
               <xsl:if test="shmf:Address/cat_ru:Region">
                  <xsl:value-of select="shmf:Address/cat_ru:Region"/>,
                    </xsl:if>
               <xsl:if test="shmf:Address/cat_ru:City">
                  <xsl:value-of select="shmf:Address/cat_ru:City"/>,
                    </xsl:if>
               <xsl:value-of select="shmf:Address/cat_ru:StreetHouse"/>
            </td>
         </tr>
         <tr>
            <td>Телефон</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:PhoneNumber"/>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!-- Информация о водителе -->
   <xsl:template match="shmf:Driver">
      <h3>Информация о водителе</h3>
      <table>
         <tr>
            <td>Водитель</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:Name"/>
            </td>
         </tr>
         <tr>
            <td>Серия водительского удостоверения</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:DrivingLicenceSeries"/>
            </td>
         </tr>
         <tr>
            <td>Номер водительского удостоверения</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:DrivingLicenceNumber"/>
            </td>
         </tr>
         <xsl:if test="shmf:DriverLicensingCard">
            <tr>
               <td>Вид лицензионной карточки</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:DriverLicensingCard/shmf:Type"/>
               </td>
            </tr>
            <tr>
               <td>Номер лицензионной карточки</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:DriverLicensingCard/shmf:Number"/>
               </td>
            </tr>
            <tr>
               <td>Дата лицензионной карточки</td>
               <td class="graphUnderline">
                  <xsl:call-template name="date">
                     <xsl:with-param name="text" select="shmf:DriverLicensingCard/shmf:Date"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
      </table>
      <h4>Предрейсовый медицинский осмотр</h4>
      <table>
         <tr>
            <td>Дата и время</td>
            <td class="graphUnderline">
               <xsl:call-template name="dateTime">
                  <xsl:with-param name="date" select="shmf:PreMedCheck/shmf:Date"/>
                  <xsl:with-param name="time" select="shmf:PreMedCheck/shmf:Time"/>
               </xsl:call-template>
            </td>
         </tr>
      </table>
      <h4>Послерейсовый медицинский осмотр</h4>
      <table>
         <tr>
            <td>Дата и время</td>
            <td class="graphUnderline">
               <xsl:call-template name="dateTime">
                  <xsl:with-param name="date" select="shmf:PostMedCheck/shmf:Date"/>
                  <xsl:with-param name="time" select="shmf:PostMedCheck/shmf:Time"/>
               </xsl:call-template>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!-- Информация о графике работы -->
   <xsl:template match="shmf:WorkingDay">
      <h3>График работы водителя</h3>
      <table>
         <tr>
            <td>Выезд из гаража</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:From"/>
            </td>
         </tr>
         <tr>
            <td>Возвращение в гараж</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:To"/>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!-- Информация об автомобиле-->
   <xsl:template match="shmf:Vehicle">
      <h3>Информация об автомобиле</h3>
      <table>
         <tr>
            <td>Марка автомобиля</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:Make"/>
            </td>
         </tr>
         <tr>
            <td>Государственный номерной знак</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:RegistrationNumber"/>
            </td>
         </tr>
         <xsl:if test="shmf:TrailerRegistrationNumber">
            <tr>
               <td>Прицеп 1</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:TrailerRegistrationNumber"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="shmf:SecondTrailerRegistrationNumber">
            <tr>
               <td>Прицеп 2</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:SecondTrailerRegistrationNumber"/>
               </td>
            </tr>
         </xsl:if>
      </table>
      <h4>Реквизиты организации-владельца</h4>
      <table>
         <tr>
            <td>Организация</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:Owner/cat_ru:OrganizationName"/>
               <xsl:if test="shmf:Owner/cat_ru:ShortName">
                        (<xsl:value-of select="shmf:Owner/cat_ru:ShortName"/>)
                    </xsl:if>
            </td>
         </tr>
         <xsl:if test="shmf:Owner/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
            <tr>
               <td>ОГРН</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:Owner/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="shmf:Owner/cat_ru:RFOrganizationFeatures/cat_ru:INN">
            <tr>
               <td>ИНН</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:Owner/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="shmf:Owner/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
            <tr>
               <td>КПП</td>
               <td class="graphUnderline">
                  <xsl:value-of select="shmf:Owner/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
               </td>
            </tr>
         </xsl:if>
      </table>
      <h4>Выезд с места постоянной стоянки</h4>
      <table>
         <tr>
            <td>Показания одометра, км</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:Start/shmf:Odometr"/>
            </td>
         </tr>
         <tr>
            <td>Дата и время выезда</td>
            <td class="graphUnderline">
               <xsl:call-template name="dateTime">
                  <xsl:with-param name="date" select="shmf:Start/shmf:Date"/>
                  <xsl:with-param name="time" select="shmf:Start/shmf:Time"/>
               </xsl:call-template>
            </td>
         </tr>
      </table>
      <h4>Приезд на место постоянной стоянки</h4>
      <table>
         <tr>
            <td>Показания одометра, км</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:Finish/shmf:Odometr"/>
            </td>
         </tr>
         <tr>
            <td>Дата и время приезда</td>
            <td class="graphUnderline">
               <xsl:call-template name="dateTime">
                  <xsl:with-param name="date" select="shmf:Finish/shmf:Date"/>
                  <xsl:with-param name="time" select="shmf:Finish/shmf:Time"/>
               </xsl:call-template>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!-- Информация о сопровождении -->
   <xsl:template match="shmf:Escort">
      <h3>Информация о сопровождении</h3>
      <table>
         <tr>
            <td>Цель сопровождения</td>
            <td class="graphUnderline">
               <xsl:value-of select="shmf:Purpose"/>
            </td>
         </tr>
         <tr>
            <td>Сопровождающие лица:</td>
            <td class="graphUnderline">
               <xsl:for-each select="shmf:Person">
                  <xsl:if test="position() >1">,
                        </xsl:if>
                  <xsl:value-of select="."/>
               </xsl:for-each>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!-- Таблица маршрутов -->
   <xsl:template match="shmf:ShippingManifest" mode="Routes">
      <h3>Информация о маршруте</h3>
      <table class="route" width="90%">
         <tr>
            <th class="route" colspan="4">Заказчик</th>
            <th class="route" colspan="2">Адрес пункта</th>
            <th class="route" rowspan="2">Наименование груза</th>
            <th class="route" rowspan="2">Номера товарно-транспортной накладной</th>
         </tr>
         <tr>
            <th class="route">название</th>
            <th class="route">ОГРН</th>
            <th class="route">ИНН</th>
            <th class="route">КПП</th>
            <th class="route">погрузки</th>
            <th class="route">разгрузки</th>
         </tr>
         <xsl:apply-templates select="shmf:Route"/>
      </table>
   </xsl:template>
   <!-- Информация об отдельном маршруте -->
   <xsl:template match="shmf:Route">
      <tr>
         <td class="route">
            <xsl:value-of select="shmf:Client/cat_ru:OrganizationName"/>
            <xsl:if test="shmf:Client/cat_ru:ShortName">
                    (<xsl:value-of select="shmf:Client/cat_ru:ShortName"/>)
                </xsl:if>
         </td>
         <td class="route">
            <xsl:value-of select="shmf:Client/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
         </td>
         <td class="route">
            <xsl:value-of select="shmf:Client/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
         </td>
         <td class="route">
            <xsl:value-of select="shmf:Client/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
         </td>
         <td class="route">
            <xsl:value-of select="shmf:From"/>
         </td>
         <td class="route">
            <xsl:value-of select="shmf:To"/>
         </td>
         <td class="route">
            <xsl:value-of select="shmf:GoodsDescription"/>
         </td>
         <td class="route">
            <xsl:for-each select="shmf:TTNNumber">
               <xsl:if test="position() >1">,</xsl:if>
               <xsl:value-of select="."/>
            </xsl:for-each>
         </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
