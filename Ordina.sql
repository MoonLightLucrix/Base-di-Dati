Creare un vincolo di integrità che eviti che i minorenni siano sposati o vedovi

DELIMITER $$
CREATE TRIGGER `Ordina` BEFORE INSERT ON `Persona` FOR EACH ROW BEGIN
	IF NEW.Anni<18
    THEN
    	IF (NEW.StatoCivile='Sposato' OR NEW.StatoCivile='Vedovo')
        THEN
        	SET NEW.StatoCivile='Celibe';
        ELSE
        	IF (NEW.StatoCivile='Sposata' OR NEW.StatoCivile='Vedova')
            THEN
        		SET NEW.StatoCivile='Nubile';
        	END IF;
        END IF;
    END IF;
END
$$
DELIMITER ;
