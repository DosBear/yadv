<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tfr_sl="urn:customs.ru:Information:CustomsDocuments:TaxFreeFromSeller:5.14.0">
  <!-- Шаблон для типа TaxFreeFromSellerType -->
  <xsl:template match="tfr_sl:TaxFreeFromSeller">
    <xsl:param name="level" select="0" />
    <html>
      <head>
        <style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
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
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
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
          <table>
            <tbody>
              <tr>
                <td align="center" class="title">
                  <font size="4">
                    <b>Чек TaxFree от продавца</b>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="tfr_sl:TypographNumber">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Типографский номер чека TaxFree</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="tfr_sl:TypographNumber" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный номер чека TaxFree</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="tfr_sl:TaxFreeID" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Порядковый номер чека TaxFree</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="tfr_sl:TaxFreeNumber" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата чека TaxFree</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="tfr_sl:TaxFreeDate" />
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <xsl:if test="tfr_sl:TaxFreeBuyer">
            <div class="title marg-top" style="padding-left:{$level*10}px">Сведения о покупателе</div>
            <div style="padding-left:{$level*10}px">
              <xsl:apply-templates select="tfr_sl:TaxFreeBuyer">
                <xsl:with-param name="level" select="$level+1" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="tfr_sl:TaxFreeSeller">
            <div class="title marg-top" style="padding-left:{$level*10}px">Сведения о продавце</div>
            <div style="padding-left:{$level*10}px">
              <xsl:apply-templates select="tfr_sl:TaxFreeSeller">
                <xsl:with-param name="level" select="$level+1" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="tfr_sl:TaxFreeOperator">
            <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об операторе TaxFree</div>
            <div style="padding-left:{$level*10}px">
              <xsl:apply-templates select="tfr_sl:TaxFreeOperator">
                <xsl:with-param name="level" select="$level+1" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="tfr_sl:CashVoucherNumber">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Номер кассового чека</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="tfr_sl:CashVoucherNumber" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="tfr_sl:CashVoucherDate">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Дата кассового чека</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:call-template name="russian_date">
                    <xsl:with-param name="dateIn" select="tfr_sl:CashVoucherDate" />
                  </xsl:call-template>
                </td>
              </tr>
            </table>
          </xsl:if>
          <div class="title marg-top">Сведения о товарах</div>
          <table class="bordered">
            <tbody>
              <tr class="title">
                <td class="graphMain bordered">Порядковый номер товара</td>
                <td class="graphMain bordered">Артикул товара</td>
                <td class="graphMain bordered">Наименование товара</td>
                <td class="graphMain bordered">Количество товара</td>
                <td class="graphMain bordered">Сумма налога, исчисленная  организацией розничной торговли </td>
                <td class="graphMain bordered">Стоимость товара</td>
              </tr>
              <xsl:for-each select="tfr_sl:TaxFreeSlGoods">
                <xsl:apply-templates select=".">
                  <xsl:with-param name="level" select="$level+1" />
                </xsl:apply-templates>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:AddressType -->
  <xsl:template match="cat_ru:Address|tfr_sl:Address">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:PostalCode">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:PostalCode" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:CountryCode">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:CountryCode" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:CounryName">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:CounryName" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:Region">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:Region" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:City">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Населенный пункт</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:City" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:StreetHouse">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:StreetHouse" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:TerritoryCode">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:TerritoryCode" />
          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="cat_ru:Contact">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:Phone">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер телефона</td>
          <td class="graphMain value" style="width:50%">
            <xsl:for-each select="cat_ru:Phone">
              <xsl:value-of select="." />
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:Fax">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер факса</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:Fax" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:Telex">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер телекса</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:Telex" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:E_mail">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
          <td class="graphMain value" style="width:50%">
            <xsl:for-each select="cat_ru:E_mail">
              <xsl:value-of select="." />
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ITNKZType -->
  <xsl:template match="cat_ru:ITN">
    <xsl:param name="level" select="0" />
    <table>
      <tr>
        <td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
        <td class="value graphMain" style="width:50%">
          <xsl:value-of select="cat_ru:CategoryCode" />
        </td>
      </tr>
    </table>
    <table>
      <tr>
        <td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
        <td class="value graphMain" style="width:50%">
          <xsl:value-of select="cat_ru:KATOCode" />
        </td>
      </tr>
    </table>
    <xsl:if test="cat_ru:RNN">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:RNN" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:ITNReserv">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:ITNReserv" />
          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:IdentityCardType -->
  <xsl:template match="cat_ru:IdentityCard">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:IdentityCardCode">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:IdentityCardCode" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:IdentityCardName">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:IdentityCardName" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:IdentityCardSeries">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:IdentityCardSeries" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:IdentityCardNumber">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:IdentityCardNumber" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:IdentityCardDate">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
          <td class="value graphMain" style="width:50%">
            <xsl:call-template name="russian_date">
              <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" />
            </xsl:call-template>
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:OrganizationName">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:OrganizationName" />
          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
  <xsl:template match="cat_ru:KGOrganizationFeatures">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:KGINN">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:choose>
              <xsl:when test="cat_ru:KGINN=ИНН">
                <xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
              </xsl:when>
              <xsl:when test="cat_ru:KGINN=ПИН">
                <xsl:text>персональный идентификационный номер</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="cat_ru:KGINN" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:KGOKPO">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:KGOKPO" />
          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RAOrganizationFeatures">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:UNN">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:UNN" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:SocialServiceNumber">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:SocialServiceNumber" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:SocialServiceCertificate">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:SocialServiceCertificate" />
          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RBOrganizationFeatures">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:UNP">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:UNP" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:RBIdentificationNumber">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:RBIdentificationNumber" />
          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RFOrganizationFeatures">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:OGRN">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:OGRN" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:INN">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:INN" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:KPP">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:KPP" />
          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RKOrganizationFeatures">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:BIN">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:BIN" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:IIN">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:IIN" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:ITN">
      <div class="title marg-top" style="padding-left:{$level*10}px">Идентификационный таможенный номер (ИТН)</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:ITN">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CUBranchDescriptionType -->
  <xsl:template match="tfr_sl:BranchDescription">
    <xsl:param name="level" select="0" />
    <table>
      <tr>
        <td class="annot graphMain" style="width:50%">Краткое наименование обособленного подразделения</td>
        <td class="value graphMain" style="width:50%">
          <xsl:value-of select="cat_ru:OrganizationName" />
        </td>
      </tr>
    </table>
    <xsl:if test="cat_ru:Address">
      <div class="title marg-top" style="padding-left:{$level*10}px">Адрес обособленного подразделения</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:Address">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="cat_ru:RFOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Российской Федерации</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="cat_ru:RKOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Республики Казахстан</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="cat_ru:RBOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Республики Беларусь</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="cat_ru:RAOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Республики Армения</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="cat_ru:KGOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Кыргызской Республики</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа tfr_sl:TfSlCountryType -->
  <xsl:template match="tfr_sl:CountryPermanentResidence">
    <xsl:param name="level" select="0" />
    <table>
      <tr>
        <td class="annot graphMain" style="width:50%">Наименование Страны</td>
        <td class="value graphMain" style="width:50%">
          <xsl:value-of select="tfr_sl:CountryName" />
        </td>
      </tr>
    </table>
    <table>
      <tr>
        <td class="annot graphMain" style="width:50%">Код страны alpha-2 (две буквы латинского алфавита)</td>
        <td class="value graphMain" style="width:50%">
          <xsl:value-of select="tfr_sl:CountryCode" />
        </td>
      </tr>
    </table>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
  <xsl:template match="tfr_sl:GoodsQuantity">
    <xsl:param name="level" select="0" />
	<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')" />
	<xsl:if test="cat_ru:MeasureUnitQualifierName">
		<xsl:text> </xsl:text>
		<xsl:value-of select="translate(cat_ru:MeasureUnitQualifierName, '.', ',')" />
	</xsl:if>
	<xsl:if test="cat_ru:MeasureUnitQualifierCode">
		<xsl:text> (</xsl:text>
		<xsl:value-of select="translate(cat_ru:MeasureUnitQualifierCode, '.', ',')" />
		<xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="tfr_sl:PersonContact">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:Phone">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер телефона</td>
          <td class="graphMain value" style="width:50%">
            <xsl:for-each select="cat_ru:Phone">
              <xsl:value-of select="." />
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:Fax">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер факса</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:Fax" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:Telex">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер телекса</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:Telex" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:E_mail">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
          <td class="graphMain value" style="width:50%">
            <xsl:for-each select="cat_ru:E_mail">
              <xsl:value-of select="." />
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа tfr_sl:TaxFreeSlBuyerType -->
  <xsl:template match="tfr_sl:TaxFreeBuyer">
    <xsl:param name="level" select="0" />
    <table>
      <tr>
        <td class="annot graphMain" style="width:50%">Фамилия</td>
        <td class="value graphMain" style="width:50%">
          <xsl:value-of select="tfr_sl:PersonSurname" />
        </td>
      </tr>
    </table>
    <table>
      <tr>
        <td class="annot graphMain" style="width:50%">Имя</td>
        <td class="value graphMain" style="width:50%">
          <xsl:value-of select="tfr_sl:PersonName" />
        </td>
      </tr>
    </table>
    <xsl:if test="tfr_sl:PersonMiddleName">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Отчество</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_sl:PersonMiddleName" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="tfr_sl:CountryPermanentResidence">
      <div class="title marg-top" style="padding-left:{$level*10}px">Страна выдачи паспорта</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="tfr_sl:CountryPermanentResidence">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="tfr_sl:IdentityCardSeries">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Серия паспорта</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_sl:IdentityCardSeries" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <table>
      <tr>
        <td class="annot graphMain" style="width:50%">Номер паспорта</td>
        <td class="value graphMain" style="width:50%">
          <xsl:value-of select="tfr_sl:IdentityCardNumber" />
        </td>
      </tr>
    </table>
    <xsl:if test="tfr_sl:IdentityCardDate">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата выдачи паспорта</td>
          <td class="value graphMain" style="width:50%">
            <xsl:call-template name="russian_date">
              <xsl:with-param name="dateIn" select="tfr_sl:IdentityCardDate" />
            </xsl:call-template>
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="tfr_sl:PersonContact">
      <div class="title marg-top" style="padding-left:{$level*10}px">Контактные данные покупателя</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="tfr_sl:PersonContact">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:OrganizationBaseType -->
  <xsl:template match="tfr_sl:TaxFreeOperator">
    <xsl:param name="level" select="0" />
    <xsl:if test="cat_ru:OrganizationName">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:OrganizationName" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:ShortName">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:ShortName" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:OrganizationLanguage">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:OrganizationLanguage" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="cat_ru:RFOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Российской Федерации</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="cat_ru:RKOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Республики Казахстан</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="cat_ru:RBOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Республики Беларусь</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="cat_ru:RAOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Республики Армения</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
    <xsl:if test="cat_ru:KGOrganizationFeatures">
      <div class="title marg-top" style="padding-left:{$level*10}px">Сведения об организации. Особенности Кыргызской Республики</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа tfr_sl:TaxFreeSellerType -->
  <xsl:template match="tfr_sl:TaxFreeSeller">
    <xsl:param name="level" select="0" />
    <xsl:if test="tfr_sl:OrganizationName">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_sl:OrganizationName" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="tfr_sl:INN">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ИНН</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_sl:INN" />
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="tfr_sl:Address">
      <div class="title marg-top" style="padding-left:{$level*10}px">Адрес организации</div>
      <div style="padding-left:{$level*10}px">
        <xsl:apply-templates select="tfr_sl:Address">
          <xsl:with-param name="level" select="$level+1" />
        </xsl:apply-templates>
      </div>
    </xsl:if>
  </xsl:template>
  <!-- Шаблон для типа tfr_sl:TaxFreeSlGoodsType -->
  <xsl:template match="tfr_sl:TaxFreeSlGoods">
    <xsl:param name="level" select="0" />
    <tr>
      <td class="graphMain bordered">
        <xsl:value-of select="tfr_sl:GoodsNumber" />
      </td>
      <td class="graphMain bordered">
        <xsl:value-of select="tfr_sl:GoodsArticul" />
      </td>
      <td class="graphMain bordered">
        <xsl:value-of select="tfr_sl:GoodsDescription" />
      </td>
      <td class="graphMain bordered">
        <xsl:if test="tfr_sl:GoodsQuantity">
          <xsl:apply-templates select="tfr_sl:GoodsQuantity">
            <xsl:with-param name="level" select="$level+1" />
          </xsl:apply-templates>
        </xsl:if>
      </td>
      <td class="graphMain bordered">
        <xsl:value-of select="translate(tfr_sl:VAT, '.', ',')" />
      </td>
      <td class="graphMain bordered">
        <xsl:value-of select="translate(tfr_sl:TotalCostGoods, '.', ',')" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="russian_date">
    <xsl:param name="dateIn" />
    <xsl:choose>
      <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
        <xsl:value-of select="substring($dateIn,9,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,6,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,1,4)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dateIn" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>