import 'package:app_inventmarket/src/models/productos_model.dart';
import 'package:supabase/supabase.dart';


const supabaseUrl = 'https://ugwfupuxmdlxyyjeuzfl.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0MDA5ODgxOCwiZXhwIjoxOTU1Njc0ODE4fQ.-N5CvtcNkUnXpnHiNqD_JV8CaA7HzpUJ2k-gnbFCNzA';
final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);

Future<List<Productos>> getMovies() async {
    var response = await supabaseClient
      .from('inventario')
      .select()
      .order('id', ascending: true)
      .execute(/*count: CountOption.exact*/);
    final dataList = response.data as List;
    return dataList.map((map) => Productos.fromJson(map)).toList();
  }
