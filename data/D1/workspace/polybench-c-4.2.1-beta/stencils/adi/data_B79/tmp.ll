; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv8 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next9, %._crit_edge.us..preheader.us_crit_edge ]
  %2 = trunc i64 %indvars.iv8 to i32
  br label %3

; <label>:3:                                      ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge11 ], [ 0, %.preheader.us ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub i32 1000, %4
  %6 = add i32 %5, %2
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  store double %8, double* %9, align 8
  %exitcond = icmp eq i64 %indvars.iv, 999
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge11:                                    ; preds = %3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %._crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
.preheader7.lr.ph:
  %6 = alloca [1000 x double]*, align 8
  %7 = alloca [1000 x double]*, align 8
  %8 = alloca [1000 x double]*, align 8
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  store [1000 x double]* %2, [1000 x double]** %6, align 8
  store [1000 x double]* %3, [1000 x double]** %7, align 8
  store [1000 x double]* %4, [1000 x double]** %8, align 8
  store [1000 x double]* %5, [1000 x double]** %9, align 8
  store double 0xC09F400000000001, double* %10, align 8
  store double 0xC09F400000000001, double* %12, align 8
  store double 0xC08F400000000001, double* %13, align 8
  store double 0x40AF420000000001, double* %11, align 8
  store double 0x409F440000000001, double* %14, align 8
  store double 0xC08F400000000001, double* %15, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge46..preheader7_crit_edge, %.preheader7.lr.ph
  %16 = phi i32 [ 1, %.preheader7.lr.ph ], [ %152, %._crit_edge46..preheader7_crit_edge ]
  %17 = phi [1000 x double]* [ %4, %.preheader7.lr.ph ], [ %76, %._crit_edge46..preheader7_crit_edge ]
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %._crit_edge27.us..lr.ph29.split.us_crit_edge, %.preheader7
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ 1, %.preheader7 ]
  %18 = phi [1000 x double]* [ %76, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ %17, %.preheader7 ]
  %19 = load [1000 x double]*, [1000 x double]** %7, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv76
  store double 1.000000e+00, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv76, i64 0
  store double 0.000000e+00, double* %21, align 8
  %22 = load [1000 x double]*, [1000 x double]** %7, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 0, i64 %indvars.iv76
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = load [1000 x double]*, [1000 x double]** %9, align 8
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv76
  %28 = bitcast [1000 x double]* %27 to i64*
  store i64 %25, i64* %28, align 8
  %29 = add nsw i64 %indvars.iv76, -1
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %.pre = load double, double* %10, align 8
  %.pre62 = load double, double* %11, align 8
  br label %39

._crit_edge27.us:                                 ; preds = %.lr.ph26.us
  %exitcond96 = icmp eq i64 %indvars.iv.next77, 999
  br i1 %exitcond96, label %.lr.ph38.us.preheader, label %._crit_edge27.us..lr.ph29.split.us_crit_edge

._crit_edge27.us..lr.ph29.split.us_crit_edge:     ; preds = %._crit_edge27.us
  br label %.lr.ph29.split.us

.lr.ph26.us:                                      ; preds = %.lr.ph26.us..lr.ph26.us_crit_edge, %._crit_edge.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %.lr.ph26.us..lr.ph26.us_crit_edge ], [ 998, %._crit_edge.us ]
  %30 = phi double [ %36, %.lr.ph26.us..lr.ph26.us_crit_edge ], [ 1.000000e+00, %._crit_edge.us ]
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv76, i64 %indvars.iv74
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %30
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv76, i64 %indvars.iv74
  %35 = load double, double* %34, align 8
  %36 = fadd double %33, %35
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv74, i64 %indvars.iv76
  store double %36, double* %37, align 8
  %38 = icmp sgt i64 %indvars.iv74, 1
  br i1 %38, label %.lr.ph26.us..lr.ph26.us_crit_edge, label %._crit_edge27.us

.lr.ph26.us..lr.ph26.us_crit_edge:                ; preds = %.lr.ph26.us
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, -1
  br label %.lr.ph26.us

; <label>:39:                                     ; preds = %._crit_edge123, %.lr.ph29.split.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge123 ], [ 1, %.lr.ph29.split.us ]
  %40 = phi double [ %80, %._crit_edge123 ], [ %.pre62, %.lr.ph29.split.us ]
  %41 = phi double [ %70, %._crit_edge123 ], [ %.pre, %.lr.ph29.split.us ]
  %42 = phi [1000 x double]* [ %76, %._crit_edge123 ], [ %18, %.lr.ph29.split.us ]
  %43 = load double, double* %12, align 8
  %44 = fsub double -0.000000e+00, %43
  %45 = add nsw i64 %indvars.iv72, -1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv76, i64 %45
  %47 = load double, double* %46, align 8
  %48 = fmul double %41, %47
  %49 = fadd double %48, %40
  %50 = fdiv double %44, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv76, i64 %indvars.iv72
  store double %50, double* %51, align 8
  %52 = load double, double* %13, align 8
  %53 = load [1000 x double]*, [1000 x double]** %6, align 8
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv72, i64 %29
  %55 = bitcast double* %54 to <2 x double>*
  %56 = fmul double %52, 2.000000e+00
  %57 = fadd double %56, 1.000000e+00
  %58 = load <2 x double>, <2 x double>* %55, align 8
  %59 = insertelement <2 x double> undef, double %52, i32 0
  %60 = insertelement <2 x double> %59, double %57, i32 1
  %61 = fmul <2 x double> %60, %58
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fsub double %63, %62
  %65 = load double, double* %15, align 8
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv72, i64 %indvars.iv.next77
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fsub double %64, %68
  %70 = load double, double* %10, align 8
  %71 = load [1000 x double]*, [1000 x double]** %9, align 8
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv76, i64 %45
  %73 = load double, double* %72, align 8
  %74 = fmul double %70, %73
  %75 = fsub double %69, %74
  %76 = load [1000 x double]*, [1000 x double]** %8, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv76, i64 %45
  %78 = load double, double* %77, align 8
  %79 = fmul double %70, %78
  %80 = load double, double* %11, align 8
  %81 = fadd double %79, %80
  %82 = fdiv double %75, %81
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv76, i64 %indvars.iv72
  store double %82, double* %83, align 8
  %exitcond = icmp eq i64 %indvars.iv72, 998
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge123

._crit_edge123:                                   ; preds = %39
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br label %39

._crit_edge.us:                                   ; preds = %39
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 999, i64 %indvars.iv76
  store double 1.000000e+00, double* %84, align 8
  br label %.lr.ph26.us

.lr.ph38.us.preheader:                            ; preds = %._crit_edge27.us
  %.pre98 = load double, double* %14, align 8
  %.pre99 = load [1000 x double]*, [1000 x double]** %7, align 8
  %.pre100 = load double, double* %12, align 8
  %85 = fsub double -0.000000e+00, %65
  %86 = fmul double %70, 2.000000e+00
  %87 = fadd double %86, 1.000000e+00
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge43.us..lver.check_crit_edge, %.lr.ph38.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph38.us.preheader ], [ %indvar.next, %._crit_edge43.us..lver.check_crit_edge ]
  %indvars.iv84 = phi i64 [ 1, %.lr.ph38.us.preheader ], [ %indvars.iv.next85, %._crit_edge43.us..lver.check_crit_edge ]
  %88 = add i64 %indvar, 1
  %89 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %76, i64 %89, i64 0
  %scevgep112 = getelementptr [1000 x double], [1000 x double]* %76, i64 %89, i64 999
  %scevgep114 = getelementptr [1000 x double], [1000 x double]* %71, i64 %89, i64 0
  %scevgep116 = getelementptr [1000 x double], [1000 x double]* %71, i64 %89, i64 999
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv84, i64 0
  store double 1.000000e+00, double* %90, align 8
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv84, i64 0
  store double 0.000000e+00, double* %91, align 8
  %92 = bitcast double* %90 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv84
  %95 = bitcast [1000 x double]* %94 to i64*
  store i64 %93, i64* %95, align 8
  %96 = add nsw i64 %indvars.iv84, -1
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %bound0 = icmp ult double* %scevgep, %scevgep116
  %bound1 = icmp ult double* %scevgep114, %scevgep112
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig..ph.lver.orig_crit_edge, %.ph.lver.orig.preheader
  %indvars.iv78.lver.orig = phi i64 [ %indvars.iv.next79.lver.orig, %.ph.lver.orig..ph.lver.orig_crit_edge ], [ 1, %.ph.lver.orig.preheader ]
  %97 = add nsw i64 %indvars.iv78.lver.orig, -1
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv84, i64 %97
  %99 = load double, double* %98, align 8
  %100 = fmul double %52, %99
  %101 = fadd double %100, %.pre98
  %102 = fdiv double %85, %101
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %102, double* %103, align 8
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %96, i64 %indvars.iv78.lver.orig
  %105 = load double, double* %104, align 8
  %106 = fmul double %70, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  %108 = load double, double* %107, align 8
  %109 = fmul double %87, %108
  %110 = fsub double %109, %106
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv.next85, i64 %indvars.iv78.lver.orig
  %112 = load double, double* %111, align 8
  %113 = fmul double %.pre100, %112
  %114 = fsub double %110, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv84, i64 %97
  %116 = load double, double* %115, align 8
  %117 = fmul double %52, %116
  %118 = fsub double %114, %117
  %119 = fdiv double %118, %101
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %119, double* %120, align 8
  %exitcond81.lver.orig = icmp eq i64 %indvars.iv78.lver.orig, 998
  br i1 %exitcond81.lver.orig, label %._crit_edge39.us.loopexit, label %.ph.lver.orig..ph.lver.orig_crit_edge

.ph.lver.orig..ph.lver.orig_crit_edge:            ; preds = %.ph.lver.orig
  %indvars.iv.next79.lver.orig = add nuw nsw i64 %indvars.iv78.lver.orig, 1
  br label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep119 = getelementptr [1000 x double], [1000 x double]* %71, i64 %88, i64 0
  %scevgep118 = getelementptr [1000 x double], [1000 x double]* %76, i64 %88, i64 0
  %load_initial = load double, double* %scevgep118, align 8
  %load_initial120 = load double, double* %scevgep119, align 8
  br label %130

._crit_edge43.us:                                 ; preds = %.lr.ph42.us
  %exitcond97 = icmp eq i64 %indvars.iv.next85, 999
  br i1 %exitcond97, label %._crit_edge46, label %._crit_edge43.us..lver.check_crit_edge

._crit_edge43.us..lver.check_crit_edge:           ; preds = %._crit_edge43.us
  %indvar.next = add i64 %indvar, 1
  br label %.lver.check

.lr.ph42.us:                                      ; preds = %.lr.ph42.us..lr.ph42.us_crit_edge, %._crit_edge39.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %.lr.ph42.us..lr.ph42.us_crit_edge ], [ 998, %._crit_edge39.us ]
  %121 = phi double [ %127, %.lr.ph42.us..lr.ph42.us_crit_edge ], [ 1.000000e+00, %._crit_edge39.us ]
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv84, i64 %indvars.iv82
  %123 = load double, double* %122, align 8
  %124 = fmul double %123, %121
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv84, i64 %indvars.iv82
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv84, i64 %indvars.iv82
  store double %127, double* %128, align 8
  %129 = icmp sgt i64 %indvars.iv82, 1
  br i1 %129, label %.lr.ph42.us..lr.ph42.us_crit_edge, label %._crit_edge43.us

.lr.ph42.us..lr.ph42.us_crit_edge:                ; preds = %.lr.ph42.us
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, -1
  br label %.lr.ph42.us

; <label>:130:                                    ; preds = %._crit_edge124, %.ph
  %store_forwarded121 = phi double [ %load_initial120, %.ph ], [ %148, %._crit_edge124 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %133, %._crit_edge124 ]
  %indvars.iv78 = phi i64 [ 1, %.ph ], [ %indvars.iv.next79, %._crit_edge124 ]
  %131 = fmul double %52, %store_forwarded
  %132 = fadd double %131, %.pre98
  %133 = fdiv double %85, %132
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv84, i64 %indvars.iv78
  store double %133, double* %134, align 8
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %96, i64 %indvars.iv78
  %136 = load double, double* %135, align 8
  %137 = fmul double %70, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv84, i64 %indvars.iv78
  %139 = load double, double* %138, align 8
  %140 = fmul double %87, %139
  %141 = fsub double %140, %137
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv.next85, i64 %indvars.iv78
  %143 = load double, double* %142, align 8
  %144 = fmul double %.pre100, %143
  %145 = fsub double %141, %144
  %146 = fmul double %52, %store_forwarded121
  %147 = fsub double %145, %146
  %148 = fdiv double %147, %132
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv84, i64 %indvars.iv78
  store double %148, double* %149, align 8
  %exitcond81 = icmp eq i64 %indvars.iv78, 998
  br i1 %exitcond81, label %._crit_edge39.us.loopexit122, label %._crit_edge124

._crit_edge124:                                   ; preds = %130
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  br label %130

._crit_edge39.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge39.us

._crit_edge39.us.loopexit122:                     ; preds = %130
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.loopexit122, %._crit_edge39.us.loopexit
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv84, i64 999
  store double 1.000000e+00, double* %150, align 8
  br label %.lr.ph42.us

._crit_edge46:                                    ; preds = %._crit_edge43.us
  %151 = icmp slt i32 %16, 500
  br i1 %151, label %._crit_edge46..preheader7_crit_edge, label %._crit_edge

._crit_edge46..preheader7_crit_edge:              ; preds = %._crit_edge46
  %152 = add nuw nsw i32 %16, 1
  br label %.preheader7

._crit_edge:                                      ; preds = %._crit_edge46
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %..preheader.us_crit_edge
  %indvars.iv8 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next9, %._crit_edge.us..preheader.us_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv8, 1000
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge6.._crit_edge7_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge6.._crit_edge7_crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge7.._crit_edge6_crit_edge

._crit_edge7.._crit_edge6_crit_edge:              ; preds = %._crit_edge7
  br label %._crit_edge6

; <label>:11:                                     ; preds = %._crit_edge7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge7.._crit_edge6_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge6.._crit_edge7_crit_edge

._crit_edge6.._crit_edge7_crit_edge:              ; preds = %._crit_edge6
  br label %._crit_edge7

._crit_edge.us:                                   ; preds = %._crit_edge6
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %._crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
