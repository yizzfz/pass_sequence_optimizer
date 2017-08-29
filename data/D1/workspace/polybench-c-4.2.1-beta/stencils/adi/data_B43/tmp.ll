; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us..preheader.us_crit_edge ]
  %2 = add nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ]
  %3 = sub nuw nsw i64 %2, %indvars.iv
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 1.000000e+03
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %6, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %._crit_edge4, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.lr.ph:
  br label %.lr.ph11.split.us.preheader

.lr.ph11.split.us.preheader:                      ; preds = %._crit_edge22..lr.ph11.split.us.preheader_crit_edge, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %129, %._crit_edge22..lr.ph11.split.us.preheader_crit_edge ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %._crit_edge9.us.._crit_edge.lver.check_crit_edge, %.lr.ph11.split.us.preheader
  %indvar = phi i64 [ %6, %._crit_edge9.us.._crit_edge.lver.check_crit_edge ], [ 0, %.lr.ph11.split.us.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us.._crit_edge.lver.check_crit_edge ], [ 1, %.lr.ph11.split.us.preheader ]
  %6 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %scevgep41 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 999
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 999
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %8, align 8
  %9 = bitcast double* %7 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27
  %12 = bitcast [1000 x double]* %11 to i64*
  store i64 %10, i64* %12, align 8
  %13 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep43, %scevgep41
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.check.._crit_edge.lver.orig_crit_edge, label %._crit_edge.ph

._crit_edge.lver.check.._crit_edge.lver.orig_crit_edge: ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.._crit_edge.lver.orig_crit_edge, %._crit_edge.lver.check.._crit_edge.lver.orig_crit_edge
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig.._crit_edge.lver.orig_crit_edge ], [ 1, %._crit_edge.lver.check.._crit_edge.lver.orig_crit_edge ]
  %14 = add nsw i64 %indvars.iv.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %14
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, 0xC09F400000000001
  %18 = fadd double %17, 0x40AF420000000001
  %19 = fdiv double 0x409F400000000001, %18
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %19, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %13
  %22 = bitcast double* %21 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fsub double %26, %25
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, 0xC08F400000000001
  %31 = fsub double %27, %30
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %14
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, 0xC09F400000000001
  %35 = fsub double %31, %34
  %36 = fdiv double %35, %18
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %36, double* %37, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.lver.orig..lr.ph8.us.preheader_crit_edge, label %._crit_edge.lver.orig.._crit_edge.lver.orig_crit_edge

._crit_edge.lver.orig.._crit_edge.lver.orig_crit_edge: ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig..lr.ph8.us.preheader_crit_edge: ; preds = %._crit_edge.lver.orig
  br label %.lr.ph8.us.preheader

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial49 = load double, double* %scevgep43, align 8
  br label %._crit_edge

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 999
  br i1 %exitcond29, label %._crit_edge9.us.._crit_edge39.lver.check_crit_edge, label %._crit_edge9.us.._crit_edge.lver.check_crit_edge

._crit_edge9.us.._crit_edge.lver.check_crit_edge: ; preds = %._crit_edge9.us
  br label %._crit_edge.lver.check

._crit_edge9.us.._crit_edge39.lver.check_crit_edge: ; preds = %._crit_edge9.us
  br label %._crit_edge39.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us..lr.ph8.us_crit_edge, %.lr.ph8.us.preheader
  %indvars.iv25 = phi i64 [ 998, %.lr.ph8.us.preheader ], [ %indvars.iv.next26, %.lr.ph8.us..lr.ph8.us_crit_edge ]
  %38 = phi double [ 1.000000e+00, %.lr.ph8.us.preheader ], [ %44, %.lr.ph8.us..lr.ph8.us_crit_edge ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %44, double* %45, align 8
  %46 = icmp sgt i64 %indvars.iv25, 1
  br i1 %46, label %.lr.ph8.us..lr.ph8.us_crit_edge, label %._crit_edge9.us

.lr.ph8.us..lr.ph8.us_crit_edge:                  ; preds = %.lr.ph8.us
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  br label %.lr.ph8.us

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.ph
  %store_forwarded50 = phi double [ %load_initial49, %._crit_edge.ph ], [ %64, %._crit_edge.._crit_edge_crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %49, %._crit_edge.._crit_edge_crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ]
  %47 = fmul double %store_forwarded, 0xC09F400000000001
  %48 = fadd double %47, 0x40AF420000000001
  %49 = fdiv double 0x409F400000000001, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  store double %49, double* %50, align 8
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %13
  %52 = bitcast double* %51 to <2 x double>*
  %53 = load <2 x double>, <2 x double>* %52, align 8
  %54 = fmul <2 x double> %53, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %55 = extractelement <2 x double> %54, i32 0
  %56 = extractelement <2 x double> %54, i32 1
  %57 = fsub double %56, %55
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next28
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, 0xC08F400000000001
  %61 = fsub double %57, %60
  %62 = fmul double %store_forwarded50, 0xC09F400000000001
  %63 = fsub double %61, %62
  %64 = fdiv double %63, %48
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %64, double* %65, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge..lr.ph8.us.preheader_crit_edge, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge..lr.ph8.us.preheader_crit_edge:       ; preds = %._crit_edge
  br label %.lr.ph8.us.preheader

.lr.ph8.us.preheader:                             ; preds = %._crit_edge..lr.ph8.us.preheader_crit_edge, %._crit_edge.lver.orig..lr.ph8.us.preheader_crit_edge
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv27
  store double 1.000000e+00, double* %66, align 8
  br label %.lr.ph8.us

._crit_edge39.lver.check:                         ; preds = %._crit_edge19.us.._crit_edge39.lver.check_crit_edge, %._crit_edge9.us.._crit_edge39.lver.check_crit_edge
  %indvar51 = phi i64 [ %67, %._crit_edge19.us.._crit_edge39.lver.check_crit_edge ], [ 0, %._crit_edge9.us.._crit_edge39.lver.check_crit_edge ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge19.us.._crit_edge39.lver.check_crit_edge ], [ 1, %._crit_edge9.us.._crit_edge39.lver.check_crit_edge ]
  %67 = add i64 %indvar51, 1
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %4, i64 %67, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %67, i64 999
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %5, i64 %67, i64 0
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %5, i64 %67, i64 999
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv35
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 0, i64 0
  store double 1.000000e+00, double* %69, align 8
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv35, i64 0
  store double 0.000000e+00, double* %70, align 8
  %71 = bitcast [1000 x double]* %68 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35
  %74 = bitcast [1000 x double]* %73 to i64*
  store i64 %72, i64* %74, align 8
  %75 = add nsw i64 %indvars.iv35, -1
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %bound061 = icmp ult double* %scevgep53, %scevgep59
  %bound162 = icmp ult double* %scevgep57, %scevgep55
  %memcheck.conflict64 = and i1 %bound061, %bound162
  br i1 %memcheck.conflict64, label %._crit_edge39.lver.check.._crit_edge39.lver.orig_crit_edge, label %._crit_edge39.ph

._crit_edge39.lver.check.._crit_edge39.lver.orig_crit_edge: ; preds = %._crit_edge39.lver.check
  br label %._crit_edge39.lver.orig

._crit_edge39.lver.orig:                          ; preds = %._crit_edge39.lver.orig.._crit_edge39.lver.orig_crit_edge, %._crit_edge39.lver.check.._crit_edge39.lver.orig_crit_edge
  %indvars.iv30.lver.orig = phi i64 [ %indvars.iv.next31.lver.orig, %._crit_edge39.lver.orig.._crit_edge39.lver.orig_crit_edge ], [ 1, %._crit_edge39.lver.check.._crit_edge39.lver.orig_crit_edge ]
  %76 = add nsw i64 %indvars.iv30.lver.orig, -1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv35, i64 %76
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, 0xC08F400000000001
  %80 = fadd double %79, 0x409F440000000001
  %81 = fdiv double 0x408F400000000001, %80
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv30.lver.orig
  store double %81, double* %82, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %75, i64 %indvars.iv30.lver.orig
  %84 = load double, double* %83, align 8
  %85 = fmul double %84, 0xC09F400000000001
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv35, i64 %indvars.iv30.lver.orig
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, 0xC0AF3E0000000001
  %89 = fsub double %88, %85
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next36, i64 %indvars.iv30.lver.orig
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, 0xC09F400000000001
  %93 = fsub double %89, %92
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %76
  %95 = load double, double* %94, align 8
  %96 = fmul double %95, 0xC08F400000000001
  %97 = fsub double %93, %96
  %98 = fdiv double %97, %80
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv30.lver.orig
  store double %98, double* %99, align 8
  %indvars.iv.next31.lver.orig = add nuw nsw i64 %indvars.iv30.lver.orig, 1
  %exitcond32.lver.orig = icmp eq i64 %indvars.iv.next31.lver.orig, 999
  br i1 %exitcond32.lver.orig, label %._crit_edge39.lver.orig..lr.ph18.us.preheader_crit_edge, label %._crit_edge39.lver.orig.._crit_edge39.lver.orig_crit_edge

._crit_edge39.lver.orig.._crit_edge39.lver.orig_crit_edge: ; preds = %._crit_edge39.lver.orig
  br label %._crit_edge39.lver.orig

._crit_edge39.lver.orig..lr.ph18.us.preheader_crit_edge: ; preds = %._crit_edge39.lver.orig
  br label %.lr.ph18.us.preheader

._crit_edge39.ph:                                 ; preds = %._crit_edge39.lver.check
  %load_initial66 = load double, double* %scevgep53, align 8
  %load_initial69 = load double, double* %scevgep57, align 8
  br label %._crit_edge39

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 999
  br i1 %exitcond37, label %._crit_edge22, label %._crit_edge19.us.._crit_edge39.lver.check_crit_edge

._crit_edge19.us.._crit_edge39.lver.check_crit_edge: ; preds = %._crit_edge19.us
  br label %._crit_edge39.lver.check

.lr.ph18.us:                                      ; preds = %.lr.ph18.us..lr.ph18.us_crit_edge, %.lr.ph18.us.preheader
  %indvars.iv33 = phi i64 [ 998, %.lr.ph18.us.preheader ], [ %indvars.iv.next34, %.lr.ph18.us..lr.ph18.us_crit_edge ]
  %100 = phi double [ 1.000000e+00, %.lr.ph18.us.preheader ], [ %106, %.lr.ph18.us..lr.ph18.us_crit_edge ]
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv33
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, %100
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv33
  %105 = load double, double* %104, align 8
  %106 = fadd double %103, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv35, i64 %indvars.iv33
  store double %106, double* %107, align 8
  %108 = icmp sgt i64 %indvars.iv33, 1
  br i1 %108, label %.lr.ph18.us..lr.ph18.us_crit_edge, label %._crit_edge19.us

.lr.ph18.us..lr.ph18.us_crit_edge:                ; preds = %.lr.ph18.us
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, -1
  br label %.lr.ph18.us

._crit_edge39:                                    ; preds = %._crit_edge39.._crit_edge39_crit_edge, %._crit_edge39.ph
  %store_forwarded70 = phi double [ %load_initial69, %._crit_edge39.ph ], [ %126, %._crit_edge39.._crit_edge39_crit_edge ]
  %store_forwarded67 = phi double [ %load_initial66, %._crit_edge39.ph ], [ %111, %._crit_edge39.._crit_edge39_crit_edge ]
  %indvars.iv30 = phi i64 [ 1, %._crit_edge39.ph ], [ %indvars.iv.next31, %._crit_edge39.._crit_edge39_crit_edge ]
  %109 = fmul double %store_forwarded67, 0xC08F400000000001
  %110 = fadd double %109, 0x409F440000000001
  %111 = fdiv double 0x408F400000000001, %110
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv30
  store double %111, double* %112, align 8
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %75, i64 %indvars.iv30
  %114 = load double, double* %113, align 8
  %115 = fmul double %114, 0xC09F400000000001
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv35, i64 %indvars.iv30
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, 0xC0AF3E0000000001
  %119 = fsub double %118, %115
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next36, i64 %indvars.iv30
  %121 = load double, double* %120, align 8
  %122 = fmul double %121, 0xC09F400000000001
  %123 = fsub double %119, %122
  %124 = fmul double %store_forwarded70, 0xC08F400000000001
  %125 = fsub double %123, %124
  %126 = fdiv double %125, %110
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv30
  store double %126, double* %127, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next31, 999
  br i1 %exitcond32, label %._crit_edge39..lr.ph18.us.preheader_crit_edge, label %._crit_edge39.._crit_edge39_crit_edge

._crit_edge39.._crit_edge39_crit_edge:            ; preds = %._crit_edge39
  br label %._crit_edge39

._crit_edge39..lr.ph18.us.preheader_crit_edge:    ; preds = %._crit_edge39
  br label %.lr.ph18.us.preheader

.lr.ph18.us.preheader:                            ; preds = %._crit_edge39..lr.ph18.us.preheader_crit_edge, %._crit_edge39.lver.orig..lr.ph18.us.preheader_crit_edge
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv35, i64 999
  store double 1.000000e+00, double* %128, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %129 = add nuw nsw i32 %.0323, 1
  %exitcond38 = icmp eq i32 %129, 501
  br i1 %exitcond38, label %._crit_edge24, label %._crit_edge22..lr.ph11.split.us.preheader_crit_edge

._crit_edge22..lr.ph11.split.us.preheader_crit_edge: ; preds = %._crit_edge22
  br label %.lr.ph11.split.us.preheader

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us..preheader.us_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge.._crit_edge8_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge8_crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge8.._crit_edge_crit_edge

._crit_edge8.._crit_edge_crit_edge:               ; preds = %._crit_edge8
  br label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge8.._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge8_crit_edge

._crit_edge.._crit_edge8_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %._crit_edge4, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
