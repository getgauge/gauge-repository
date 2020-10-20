
import { Step, Table } from "gauge-ts";
import { strictEqual } from 'assert';

export default class StepImplementation {

    private vowels: Array<string>;

    @Step("Vowels in English language are <vowelString>.")
    public async setLanguageVowels(vowelString: string) {
        this.vowels = vowelString.split('');
    }

    @Step("The word <word> has <expectedCount> vowels.")
    public async verifyVowelsCountInWord(word: string, expectedCount: string) {
        strictEqual(this.countVowels(word), parseInt(expectedCount));
    }

    @Step("Almost all words have vowels <wordsTable>")
    public async verifyVowelsCountInMultipleWords(table: Table) {
        for (let row of table.getTableRows()) {
            let word: string = row.getCell("Word");
            let expectedCount = parseInt(row.getCell("Vowel Count"));
            let actualCount = this.countVowels(word);
            strictEqual(expectedCount, actualCount);
        }
    }

    private countVowels(word: string) {
        return word.split("").filter((elem) => {
            return this.vowels.includes(elem);
        }).length;
    }

}
