"""Bier 0.0 Track V2 — Gold Master LOCKED data (lessons 16-45)."""

from __future__ import annotations

from bier_0_0_gold_master_locked_data import (  # noqa: E402
    FOOD_PAIRING_WAAROM,
    GOLD_KEY_CONCEPTS,
)


def apply_part2() -> None:
    GOLD_KEY_CONCEPTS.update(_GOLD_KEY_CONCEPTS)
    FOOD_PAIRING_WAAROM.update(_FOOD_PAIRING_WAAROM)


_GOLD_KEY_CONCEPTS = {
    16: ["0.0-pils", "frisheid", "bitterbalans", "drinkbaarheid", "kwaliteitsdiagnose"],
    17: ["0.0-IPA", "hopintensiteit", "bodycompensatie", "bitterrisico", "aromatische intensiteit"],
    18: ["0.0-witbier", "kruidigheid", "koolzuur", "textuur", "lunchpairing"],
    19: ["0.0-blond", "moutzoetheid", "brugstijl", "lengte", "toegankelijkheid"],
    20: ["0.0-donker", "geroosterde mout", "Maillard-brug", "mondgevoel", "umami"],
    21: ["massamarkt", "consistentie", "instapsegment", "alcohol-switching", "assortimentslogica"],
    22: ["craft 0.0", "hopdosering", "premiumpositionering", "signatureplaatsing", "innovatie"],
    23: ["isotone positionering", "claimdiscipline", "sportcontext", "verwachtingsmanagement", "nuance"],
    24: ["functioneel bier", "ingrediëntclaim", "smaakprofiel", "functioneel moment", "transparantie"],
    25: ["premiumpositionering", "proefkwaliteit", "presentatie", "upsell", "gastsegment"],
    26: ["sportcontext", "herstelmoment", "alcohol-switching", "verwachtingsmanagement", "hydratielogica"],
    27: ["calorievergelijking", "extract", "restsuiker", "segmentvergelijking", "nuance"],
    28: ["suikerlabel", "restsuiker", "zoetheidsperceptie", "pairinglogica", "bittermaskering"],
    29: ["hydratielogica", "koolzuur", "functioneel moment", "contextadvies", "verwachtingsmanagement"],
    30: ["sociale context", "stigmavermindering", "stijlkeuze", "presentatie", "alcohol-switching"],
    31: ["serveertemperatuur", "frisheid", "aroma-opening", "maskeringsrisico", "stijlcalibratie"],
    32: ["glasselectie", "aroma-concentratie", "schuimstabiliteit", "temperatuurbehoud", "hygiëne"],
    33: ["presentatie", "inschenktechniek", "schuimkwaliteit", "premiumpositionering", "beleving"],
    34: ["bewaring", "lichtinvloed", "aroma-behoud", "koolzuurbehoud", "taprotatie"],
    35: ["serviceflow", "foutpreventie", "temperatuurcontrole", "horeca-advies", "integratie"],
    36: ["lunchpairing", "frisheid", "vet-bitter", "koolzuur-zout", "drinkbaarheid"],
    37: ["kaaspairing", "vet-bitter", "zout-lift", "umami", "mondgevoelcontrast"],
    38: ["licht gerecht", "harmonie", "restzoetheid", "delicaatheid", "stijlcalibratie"],
    39: ["contrastpairing", "harmoniepairing", "bitter-vet", "zoet-zuur", "spanning"],
    40: ["menu-engineering", "gastronomie", "drankbegeleiding", "stijlwissel", "technische pairing"],
    41: ["blindvergelijking", "pilscontrast", "mondgevoel", "lengte", "restzoetheid"],
    42: ["blindvergelijking", "hopintegratie", "bitterafdronk", "IPA-contrast", "calibratie"],
    43: ["stijlherkenning", "parameterclusters", "blindobjectiviteit", "mondgevoel", "signatuur"],
    44: ["theorie-integratie", "examen", "certificering", "kennistoetsing", "module-overzicht"],
    45: ["praktijkintegratie", "service", "pairing", "mastercompetentie", "blindproef"],
}

_FOOD_PAIRING_WAAROM = {
    21: (
        "Massamarkt-0.0 met stabiele bitterbalans snijdt door vet van borrelhapjes; koolzuur lift zout; "
        "herkenbare smaak verlaagt drempel voor alcohol-switching zonder premiumclaim."
    ),
    25: (
        "Premium 0.0 met diepere mout of gecontroleerde hopintensiteit draagt umami en zout; correct glas en "
        "temperatuur versterken gastronomische geloofwaardigheid die de prijs rechtvaardigt."
    ),
    36: (
        "Pils 0.0: koolzuur lift zout en ei; bitterheid snijdt door vet van dressing; frisheid houdt lunch drinkbaar "
        "zonder zwaarte op het palet."
    ),
}
