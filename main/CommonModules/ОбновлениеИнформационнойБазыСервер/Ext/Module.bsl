﻿
#Область ПрограммныйИнтерфейс

Процедура НачатьОбновлениеИнформационнойБазы() Экспорт
	
	ПервыйЗапускПрограммы();	
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиОбновления

Процедура ПервыйЗапускПрограммы() Экспорт
	
	ВыполнитьОбновлениеСправочникаПрививок();
	ВыполнитьОбновлениеСправочникаИнфекций();
	Справочники.КалендариПрививок.ЗаполнитьКалендариПрививок();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыФункции

Процедура ВыполнитьОбновлениеСправочникаПрививок(МассивОбновляемыхПрививок = Неопределено)
	
	СписокПрививок = Справочники.Вакцины.СформироватьДанныеВакцин();
	
	Если МассивОбновляемыхПрививок = Неопределено Тогда
		Для каждого ПрививкаКлючЗначение Из СписокПрививок Цикл
			ОбновитьВакцину(ПрививкаКлючЗначение);
		КонецЦикла;	
	Иначе
		Для каждого ОбновляемаяПрививка Из МассивОбновляемыхПрививок Цикл
			ПрививкаКлючЗначение = СписокПрививок.Получить(ОбновляемаяПрививка);
			Если ПрививкаКлючЗначение <> Неопределено Тогда
				ОбновитьВакцину(ПрививкаКлючЗначение);
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	
КонецПроцедуры

Процедура ОбновитьВакцину(ВакцинаКлючЗначение)
	
	ВакцинаОбъект = ВакцинаКлючЗначение.Ключ.ПолучитьОбъект();
	ЗаполнитьЗначенияСвойств(ВакцинаОбъект, ВакцинаКлючЗначение.Значение);
	
	ВакцинаОбъект.Инфекции.Очистить();
	
	Для каждого Инфекция Из ВакцинаКлючЗначение.Значение.Инфекции Цикл
		Если Не ЗначениеЗаполнено(Инфекция) Тогда
			Продолжить;
		КонецЕсли;
		НоваяСтрока = ВакцинаОбъект.Инфекции.Добавить();
		НоваяСтрока.Инфекция = Инфекция;
	КонецЦикла;
	
	ВакцинаОбъект.ОбменДанными.Загрузка = Истина;
	ВакцинаОбъект.Записать();

КонецПроцедуры

Процедура ВыполнитьОбновлениеСправочникаИнфекций(МассивОбновляемыхИнфекций = Неопределено)
	
	СписокИнфекций = Справочники.Инфекции.СформироватьДанныеИнфекций();
	
	Если МассивОбновляемыхИнфекций = Неопределено Тогда
		Для каждого ИнфекцияКлючЗначение Из СписокИнфекций Цикл
			ОбновитьИнфекцию(ИнфекцияКлючЗначение);
		КонецЦикла;	
	Иначе
		Для каждого ОбновляемаяИнфекция Из МассивОбновляемыхИнфекций Цикл
			ИнфекцияКлючЗначение = СписокИнфекций.Получить(ОбновляемаяИнфекция);
			Если ИнфекцияКлючЗначение <> Неопределено Тогда
				ОбновитьИнфекцию(ИнфекцияКлючЗначение);
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	
КонецПроцедуры

Процедура ОбновитьИнфекцию(ИнфекцияКлючЗначение)
	
	ИнфекцияОбъект = ИнфекцияКлючЗначение.Ключ.ПолучитьОбъект();
	ЗаполнитьЗначенияСвойств(ИнфекцияОбъект, ИнфекцияКлючЗначение.Значение);
	
	ИнфекцияОбъект.МесяцаВакцинаций.Очистить();
	ИнфекцияОбъект.МесяцаВакцинацийДляЛицИзГруппРиска.Очистить();
	ИнфекцияОбъект.Вакцины.Очистить();
	
	Для каждого МесяцВакцинации Из ИнфекцияКлючЗначение.Значение.МесяцаВакцинаций Цикл
		НоваяСтрока = ИнфекцияОбъект.МесяцаВакцинаций.Добавить();
		НоваяСтрока.Месяц = МесяцВакцинации;
		НоваяСтрока.ПредставлениеВозраста = ОбщегоНазначенияКлиентСервер.ПолучитьПредставлениеВозраста(МесяцВакцинации);
	КонецЦикла;
	
	Для каждого МесяцВакцинации Из ИнфекцияКлючЗначение.Значение.МесяцаВакцинацийДляЛицИзГруппРиска Цикл
		НоваяСтрока = ИнфекцияОбъект.МесяцаВакцинацийДляЛицИзГруппРиска.Добавить();
		НоваяСтрока.Месяц = МесяцВакцинации;
		НоваяСтрока.ПредставлениеВозраста = ОбщегоНазначенияКлиентСервер.ПолучитьПредставлениеВозраста(МесяцВакцинации);
	КонецЦикла;
	
	Для каждого Вакцина Из ИнфекцияКлючЗначение.Значение.Вакцины Цикл
		Если Не ЗначениеЗаполнено(Вакцина) Тогда
			Продолжить;
		КонецЕсли;
		НоваяСтрока = ИнфекцияОбъект.Вакцины.Добавить();
		НоваяСтрока.Вакцина = Вакцина;
	КонецЦикла;
	
	ИнфекцияОбъект.ОбменДанными.Загрузка = Истина;
	ИнфекцияОбъект.Записать();

КонецПроцедуры

#КонецОбласти