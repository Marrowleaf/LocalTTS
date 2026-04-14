# Piper TTS Pronunciation Guide

 phonetic mappings to fix common mispronunciations in Piper TTS.

## Common Issues (from rhasspy/piper GitHub issues)

### Roman Numerals
| Input | Pronounced As | Should Be |
|-------|----------------|-----------|
| World War II | "World War roman 2" | "World War Two" |
| World War I | "World War roman 1" | "World War One" |
| III | "roman 3" | "Three" |
| IV | "roman 4" | "Four" |

### Currency & Numbers
| Input | Pronounced As | Should Be |
|-------|----------------|-----------|
| $500 | "Dollar five hundred" | "$500" or "five hundred dollars" |
| £50 | "Pound fifty" | "fifty pounds" |

### Abbreviations
| Input | Pronounced As | Should Be |
|-------|----------------|-----------|
| Jr. | "Jay arr" | "Junior" |
| Mr | "m r" | "Mister" |
| Mrs | "mrs" | "Missus" |
| Dr | "d r" | "Doctor" |
| St | "s t" | "Street" or "Saint" |
| Ave | "a v e" | "Avenue" |

### Names & Proper Nouns (Workarounds)
| Input | Pronounced As | Workaround |
|-------|----------------|------------|
| Geis | "gice" (wrong) | "Ghice" |

### Years & Dates
| Input | Pronounced As | Should Be |
|-------|----------------|-----------|
| 1920 | "one thousand nine hundred and twenty" | "nineteen twenty" |
| 1908 | "one thousand nine hundred and eight" | "nineteen oh eight" |
| 90210 | "ninety thousand two hundred and ten" | "nine zero two one zero" (zip code) |

### Homographs (context-dependent)
| Word | Verb (like) | Noun (like) |
|------|-------------|-------------|
| live | /lɪv/ | /laɪv/ |
| lead | /liːd/ | /lɛd/ |
| record | /rɪˈkɔːrd/ | /ˈrekɔːrd/ |
| object | /əbˈdʒɛkt/ | /ˈɒbdʒɛkt/ |

## Usage

Apply these replacements in pre-processing before sending text to Piper TTS:

```python
import re

def fix_pronunciation(text):
    # Roman numerals
    text = re.sub(r'\bII\b', 'Two', text)
    text = re.sub(r'\bIII\b', 'Three', text)
    text = re.sub(r'\bIV\b', 'Four', text)
    text = re.sub(r'\bI\b', 'One', text)
    
    # Abbreviations
    text = re.sub(r'\bJr\.\s', 'Junior ', text)
    text = re.sub(r'\bMr\b', 'Mister', text)
    text = re.sub(r'\bMrs\b', 'Missus', text)
    text = re.sub(r'\bDr\b', 'Doctor', text)
    
    return text
```

## Voice-Specific Notes

- **en_US_amy_low**: Good for general use, may struggle with complex numbers
- Add model-specific mappings as discovered

## Additional Issues (from Community Reports)

### Decimal Fractions
Piper may interpret periods at end of sentences as decimal points. Add space after period before numbers: "5. 5" instead of "5.5"

### Numbers in Context
When numbers have special meaning (phone numbers, zip codes, years), spell them out phonetically or use word forms.

## Contributing

Add new problematic words here with:
- The original text
- How it's currently pronounced
- The intended pronunciation
- Suggested phonetic override if known