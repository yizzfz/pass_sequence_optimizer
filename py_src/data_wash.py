import tools.data_wash
import tools.data_parse
import tools.data_generate
import tools.data_save


def main():
    parser = tools.data_parse.Data_parse()
    data = parser.parse()

    washer = tools.data_wash.Data_wash(*data)
    data = washer.wash()

    saver = tools.data_save.Data_saver(data)
    saver.save()
    # generator = tools.data_generate.Data_generate(data)
    # generator.generate()



if __name__ == '__main__':
    main()
