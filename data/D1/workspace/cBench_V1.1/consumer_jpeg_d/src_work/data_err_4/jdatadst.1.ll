; ModuleID = 'jdatadst.ll'
source_filename = "jdatadst.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_compress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_destination_mgr*, i32, i32, i32, i32, double, i32, i32, i32, %struct.jpeg_component_info*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], [16 x i8], [16 x i8], [16 x i8], i32, %struct.jpeg_scan_info*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, %struct.jpeg_comp_master*, %struct.jpeg_c_main_controller*, %struct.jpeg_c_prep_controller*, %struct.jpeg_c_coef_controller*, %struct.jpeg_marker_writer*, %struct.jpeg_color_converter*, %struct.jpeg_downsampler*, %struct.jpeg_forward_dct*, %struct.jpeg_entropy_encoder* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_destination_mgr = type { i8*, i64, void (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type opaque
%struct.jpeg_c_main_controller = type opaque
%struct.jpeg_c_prep_controller = type opaque
%struct.jpeg_c_coef_controller = type opaque
%struct.jpeg_marker_writer = type opaque
%struct.jpeg_color_converter = type opaque
%struct.jpeg_downsampler = type opaque
%struct.jpeg_forward_dct = type opaque
%struct.jpeg_entropy_encoder = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.my_destination_mgr = type { %struct.jpeg_destination_mgr, %struct._IO_FILE*, i8* }

; Function Attrs: noinline nounwind uwtable
define void @jpeg_stdio_dest(%struct.jpeg_compress_struct*, %struct._IO_FILE*) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %4 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %3, align 8
  %5 = icmp eq %struct.jpeg_destination_mgr* %4, null
  br i1 %5, label %6, label %12

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %8 = bitcast %struct.jpeg_memory_mgr** %7 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %8, align 8
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %.cast2 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %11 = tail call i8* %10(%struct.jpeg_common_struct* %.cast2, i32 0, i64 56) #3
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr6 = add i64 %sunkaddr, 32
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i8**
  store i8* %11, i8** %sunkaddr7, align 8
  br label %12

; <label>:12:                                     ; preds = %6, %2
  %13 = ptrtoint %struct._IO_FILE* %1 to i64
  %sunkaddr8 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr9 = add i64 %sunkaddr8, 32
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to %struct.my_destination_mgr**
  %14 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %sunkaddr10, align 8
  %15 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %14, i64 0, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*)* @init_destination, void (%struct.jpeg_compress_struct*)** %15, align 8
  %16 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %14, i64 0, i32 0, i32 3
  store i32 (%struct.jpeg_compress_struct*)* @empty_output_buffer, i32 (%struct.jpeg_compress_struct*)** %16, align 8
  %17 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %14, i64 0, i32 0, i32 4
  store void (%struct.jpeg_compress_struct*)* @term_destination, void (%struct.jpeg_compress_struct*)** %17, align 8
  %18 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %14, i64 0, i32 1
  %19 = bitcast %struct._IO_FILE** %18 to i64*
  store i64 %13, i64* %19, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @init_destination(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %3 = bitcast %struct.jpeg_destination_mgr** %2 to %struct.my_destination_mgr**
  %4 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %6 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %7 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %6, align 8
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %10 = tail call i8* %8(%struct.jpeg_common_struct* %9, i32 1, i64 4096) #3
  %11 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %4, i64 0, i32 2
  store i8* %10, i8** %11, align 8
  %.cast = ptrtoint i8* %10 to i64
  %12 = bitcast %struct.my_destination_mgr* %4 to i64*
  store i64 %.cast, i64* %12, align 8
  %13 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %4, i64 0, i32 0, i32 1
  store i64 4096, i64* %13, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @empty_output_buffer(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %3 = bitcast %struct.jpeg_destination_mgr** %2 to %struct.my_destination_mgr**
  %4 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %4, i64 0, i32 2
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %4, i64 0, i32 1
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %9 = tail call i64 @fwrite(i8* %6, i64 1, i64 4096, %struct._IO_FILE* %8) #3
  %10 = icmp eq i64 %9, 4096
  br i1 %10, label %19, label %11

; <label>:11:                                     ; preds = %1
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 5
  store i32 36, i32* %14, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %18) #3
  br label %19

; <label>:19:                                     ; preds = %1, %11
  %sunkaddr = ptrtoint %struct.my_destination_mgr* %4 to i64
  %sunkaddr3 = add i64 %sunkaddr, 48
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i64*
  %20 = load i64, i64* %sunkaddr4, align 8
  %21 = bitcast %struct.my_destination_mgr* %4 to i64*
  store i64 %20, i64* %21, align 8
  %22 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %4, i64 0, i32 0, i32 1
  store i64 4096, i64* %22, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal void @term_destination(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %3 = bitcast %struct.jpeg_destination_mgr** %2 to %struct.my_destination_mgr**
  %4 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %4, i64 0, i32 0, i32 1
  %6 = load i64, i64* %5, align 8
  %7 = sub i64 4096, %6
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %24, label %9

; <label>:9:                                      ; preds = %1
  %10 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %4, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %4, i64 0, i32 1
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %14 = tail call i64 @fwrite(i8* %11, i64 1, i64 %7, %struct._IO_FILE* %13) #3
  %15 = icmp eq i64 %14, %7
  br i1 %15, label %24, label %16

; <label>:16:                                     ; preds = %9
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 5
  store i32 36, i32* %19, align 8
  %20 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %21 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %20, align 8
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %22(%struct.jpeg_common_struct* %23) #3
  br label %24

; <label>:24:                                     ; preds = %16, %9, %1
  %25 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %4, i64 0, i32 1
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %25, align 8
  %27 = tail call i32 @fflush(%struct._IO_FILE* %26) #3
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %25, align 8
  %29 = tail call i32 @ferror(%struct._IO_FILE* %28) #3
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %39, label %31

; <label>:31:                                     ; preds = %24
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 5
  store i32 36, i32* %34, align 8
  %35 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %36 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %35, align 8
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  %38 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %37(%struct.jpeg_common_struct* %38) #3
  ret void

; <label>:39:                                     ; preds = %24
  ret void
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
