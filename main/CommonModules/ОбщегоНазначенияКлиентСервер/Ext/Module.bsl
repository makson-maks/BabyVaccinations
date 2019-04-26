﻿
#Область ПрограммныйИнтерфейс

Процедура СообщитьПользователю(
		Знач ТекстСообщенияПользователю,
		Знач КлючДанных = Неопределено,
		Знач Поле = "",
		Знач ПутьКДанным = "",
		Отказ = Ложь) Экспорт
	
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = ТекстСообщенияПользователю;
	Сообщение.Поле = Поле;
	Сообщение.КлючДанных = КлючДанных;
	
	Если НЕ ПустаяСтрока(ПутьКДанным) Тогда
		Сообщение.ПутьКДанным = ПутьКДанным;
	КонецЕсли;
		
	Сообщение.Сообщить();
	
	Отказ = Истина;
	
КонецПроцедуры

Функция ПолучитьПредставлениеВозраста(ВозрастВМесяцах) Экспорт
	
	СоставляющиеВозраста = РассчитатьСоставляющиеВозраста(ВозрастВМесяцах);
	
	Если СоставляющиеВозраста.Лет < 5 Тогда
		ПредставлениеВозраста = НСтр("ru = '%1 год. %2 мес. %3 нед.'");
	Иначе
		ПредставлениеВозраста = НСтр("ru = '%1 лет %2 мес. %3 нед.'");
	КонецЕсли;
	
	ПредставлениеВозраста = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(ПредставлениеВозраста,
		СоставляющиеВозраста.Лет, СоставляющиеВозраста.Месяцев, СоставляющиеВозраста.Недель);
	
	ПредставлениеВозраста = СтрЗаменить(ПредставлениеВозраста, "0 лет ", "");	
	ПредставлениеВозраста = СтрЗаменить(ПредставлениеВозраста, "0 год. ", "");
	ПредставлениеВозраста = СтрЗаменить(ПредставлениеВозраста, " 0 нед.", "");
	
	Если СоставляющиеВозраста.Лет <> 0 Или СоставляющиеВозраста.Недель <> 0 Тогда
		ПредставлениеВозраста = СтрЗаменить(ПредставлениеВозраста, " 0 мес.", "");
	КонецЕсли;
		
	Возврат ПредставлениеВозраста;
	
КонецФункции

Функция РассчитатьСоставляющиеВозраста(Возраст) Экспорт
	
	Лет 	= Цел(Возраст / 12);
	Месяцев = Цел(Возраст) - (Лет * 12);
	Недель  = (Возраст - Цел(Возраст)) * 10;
	
	СтруктураВозраста = Новый Структура;
	СтруктураВозраста.Вставить("Лет", Лет);
	СтруктураВозраста.Вставить("Месяцев", Месяцев);
	СтруктураВозраста.Вставить("Недель", Недель);
	
	Возврат СтруктураВозраста;
	
КонецФункции

Функция СериализоватьСтруктураВJSON(СтруктураДанных) Экспорт
	
	Для каждого КлючЗначение Из СтруктураДанных Цикл
		Если ТипЗнч(КлючЗначение.Значение) = Тип("Дата") Тогда
			// ни чего не делаем
		ИначеЕсли ТипЗнч(КлючЗначение.Значение) = Тип("Строка") Тогда	
			// ни чего не делаем
		ИначеЕсли ТипЗнч(КлючЗначение.Значение) = Тип("Число") Тогда	
			// ни чего не делаем
		ИначеЕсли ТипЗнч(КлючЗначение.Значение) = Тип("Булево") Тогда	
			// ни чего не делаем	
		Иначе
			СтруктураДанных[КлючЗначение.Ключ] = Строка(КлючЗначение.Значение.УникальныйИдентификатор());
		КонецЕсли;
	КонецЦикла;
	
	Запись = Новый ЗаписьJSON;
	Запись.УстановитьСтроку();
	ЗаписатьJSON(Запись, СтруктураДанных);
	
	Возврат Запись.Закрыть();
	
КонецФункции

Функция ДесериализоватьСтруктуруИзJSON(СтрокаДанных) Экспорт
	
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(СтрокаДанных);
	
	СтруктураДанных = ПрочитатьJSON(ЧтениеJSON); 
	
	ОбщегоНазначенияСервер.ОбработатьСтруктуруИзУведомления(СтруктураДанных);
	
	Возврат СтруктураДанных;
	
КонецФункции

#КонецОбласти