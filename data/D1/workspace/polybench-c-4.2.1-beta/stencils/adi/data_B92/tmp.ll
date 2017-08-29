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
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
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

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv7 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next8, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv7, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %4 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub nuw nsw i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub nuw nsw i32 %3, %9
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %8 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
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

.preheader7:                                      ; preds = %._crit_edge46, %.preheader7.lr.ph
  %16 = phi i32 [ 1, %.preheader7.lr.ph ], [ %165, %._crit_edge46 ]
  %17 = phi [1000 x double]* [ %4, %.preheader7.lr.ph ], [ %83, %._crit_edge46 ]
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %._crit_edge27.us, %.preheader7
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge27.us ], [ 1, %.preheader7 ]
  %18 = phi [1000 x double]* [ %83, %._crit_edge27.us ], [ %17, %.preheader7 ]
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
  br label %46

._crit_edge27.us:                                 ; preds = %.lr.ph26.us
  %exitcond96 = icmp eq i64 %indvars.iv.next77, 999
  br i1 %exitcond96, label %.lr.ph38.us.preheader, label %.lr.ph29.split.us

.lr.ph26.us:                                      ; preds = %.lr.ph26.us, %._crit_edge.us
  %indvars.iv74 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next75.1, %.lr.ph26.us ]
  %30 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %43, %.lr.ph26.us ]
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv76, i64 %indvars.iv74
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %30
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv76, i64 %indvars.iv74
  %35 = load double, double* %34, align 8
  %36 = fadd double %33, %35
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv74, i64 %indvars.iv76
  store double %36, double* %37, align 8
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, -1
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv76, i64 %indvars.iv.next75
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %36
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv76, i64 %indvars.iv.next75
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv.next75, i64 %indvars.iv76
  store double %43, double* %44, align 8
  %45 = icmp sgt i64 %indvars.iv.next75, 1
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, -2
  br i1 %45, label %.lr.ph26.us, label %._crit_edge27.us

; <label>:46:                                     ; preds = %46, %.lr.ph29.split.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %46 ], [ 1, %.lr.ph29.split.us ]
  %47 = phi double [ %87, %46 ], [ %.pre62, %.lr.ph29.split.us ]
  %48 = phi double [ %77, %46 ], [ %.pre, %.lr.ph29.split.us ]
  %49 = phi [1000 x double]* [ %83, %46 ], [ %18, %.lr.ph29.split.us ]
  %50 = load double, double* %12, align 8
  %51 = fsub double -0.000000e+00, %50
  %52 = add nsw i64 %indvars.iv72, -1
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %49, i64 %indvars.iv76, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fmul double %48, %54
  %56 = fadd double %55, %47
  %57 = fdiv double %51, %56
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %49, i64 %indvars.iv76, i64 %indvars.iv72
  store double %57, double* %58, align 8
  %59 = load double, double* %13, align 8
  %60 = load [1000 x double]*, [1000 x double]** %6, align 8
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv72, i64 %29
  %62 = bitcast double* %61 to <2 x double>*
  %63 = fmul double %59, 2.000000e+00
  %64 = fadd double %63, 1.000000e+00
  %65 = load <2 x double>, <2 x double>* %62, align 8
  %66 = insertelement <2 x double> undef, double %59, i32 0
  %67 = insertelement <2 x double> %66, double %64, i32 1
  %68 = fmul <2 x double> %67, %65
  %69 = extractelement <2 x double> %68, i32 0
  %70 = extractelement <2 x double> %68, i32 1
  %71 = fsub double %70, %69
  %72 = load double, double* %15, align 8
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv72, i64 %indvars.iv.next77
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fsub double %71, %75
  %77 = load double, double* %10, align 8
  %78 = load [1000 x double]*, [1000 x double]** %9, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv76, i64 %52
  %80 = load double, double* %79, align 8
  %81 = fmul double %77, %80
  %82 = fsub double %76, %81
  %83 = load [1000 x double]*, [1000 x double]** %8, align 8
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv76, i64 %52
  %85 = load double, double* %84, align 8
  %86 = fmul double %77, %85
  %87 = load double, double* %11, align 8
  %88 = fadd double %86, %87
  %89 = fdiv double %82, %88
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv76, i64 %indvars.iv72
  store double %89, double* %90, align 8
  %exitcond = icmp eq i64 %indvars.iv72, 998
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br i1 %exitcond, label %._crit_edge.us, label %46

._crit_edge.us:                                   ; preds = %46
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 999, i64 %indvars.iv76
  store double 1.000000e+00, double* %91, align 8
  br label %.lr.ph26.us

.lr.ph38.us.preheader:                            ; preds = %._crit_edge27.us
  %.pre98 = load double, double* %14, align 8
  %.pre99 = load [1000 x double]*, [1000 x double]** %7, align 8
  %.pre100 = load double, double* %12, align 8
  %92 = fsub double -0.000000e+00, %72
  %93 = fmul double %77, 2.000000e+00
  %94 = fadd double %93, 1.000000e+00
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge43.us, %.lr.ph38.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph38.us.preheader ], [ %95, %._crit_edge43.us ]
  %indvars.iv84 = phi i64 [ 1, %.lr.ph38.us.preheader ], [ %indvars.iv.next85, %._crit_edge43.us ]
  %95 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %83, i64 %95, i64 0
  %scevgep112 = getelementptr [1000 x double], [1000 x double]* %83, i64 %95, i64 999
  %scevgep114 = getelementptr [1000 x double], [1000 x double]* %78, i64 %95, i64 0
  %scevgep116 = getelementptr [1000 x double], [1000 x double]* %78, i64 %95, i64 999
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv84, i64 0
  store double 1.000000e+00, double* %96, align 8
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 0
  store double 0.000000e+00, double* %97, align 8
  %98 = bitcast double* %96 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84
  %101 = bitcast [1000 x double]* %100 to i64*
  store i64 %99, i64* %101, align 8
  %102 = add nsw i64 %indvars.iv84, -1
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %bound0 = icmp ult double* %scevgep, %scevgep116
  %bound1 = icmp ult double* %scevgep114, %scevgep112
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv78.lver.orig = phi i64 [ %indvars.iv.next79.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %103 = add nsw i64 %indvars.iv78.lver.orig, -1
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %103
  %105 = load double, double* %104, align 8
  %106 = fmul double %59, %105
  %107 = fadd double %106, %.pre98
  %108 = fdiv double %92, %107
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %108, double* %109, align 8
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %102, i64 %indvars.iv78.lver.orig
  %111 = load double, double* %110, align 8
  %112 = fmul double %77, %111
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  %114 = load double, double* %113, align 8
  %115 = fmul double %94, %114
  %116 = fsub double %115, %112
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv.next85, i64 %indvars.iv78.lver.orig
  %118 = load double, double* %117, align 8
  %119 = fmul double %.pre100, %118
  %120 = fsub double %116, %119
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %103
  %122 = load double, double* %121, align 8
  %123 = fmul double %59, %122
  %124 = fsub double %120, %123
  %125 = fdiv double %124, %107
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %125, double* %126, align 8
  %exitcond81.lver.orig = icmp eq i64 %indvars.iv78.lver.orig, 998
  %indvars.iv.next79.lver.orig = add nuw nsw i64 %indvars.iv78.lver.orig, 1
  br i1 %exitcond81.lver.orig, label %._crit_edge39.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial120 = load double, double* %scevgep114, align 8
  br label %143

._crit_edge43.us:                                 ; preds = %.lr.ph42.us
  %exitcond97 = icmp eq i64 %indvars.iv.next85, 999
  br i1 %exitcond97, label %._crit_edge46, label %.lver.check

.lr.ph42.us:                                      ; preds = %.lr.ph42.us, %._crit_edge39.us
  %indvars.iv82 = phi i64 [ 998, %._crit_edge39.us ], [ %indvars.iv.next83.1, %.lr.ph42.us ]
  %127 = phi double [ 1.000000e+00, %._crit_edge39.us ], [ %140, %.lr.ph42.us ]
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %indvars.iv82
  %129 = load double, double* %128, align 8
  %130 = fmul double %129, %127
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %indvars.iv82
  %132 = load double, double* %131, align 8
  %133 = fadd double %130, %132
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv84, i64 %indvars.iv82
  store double %133, double* %134, align 8
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, -1
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %indvars.iv.next83
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %133
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %indvars.iv.next83
  %139 = load double, double* %138, align 8
  %140 = fadd double %137, %139
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv84, i64 %indvars.iv.next83
  store double %140, double* %141, align 8
  %142 = icmp sgt i64 %indvars.iv.next83, 1
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82, -2
  br i1 %142, label %.lr.ph42.us, label %._crit_edge43.us

; <label>:143:                                    ; preds = %143, %.ph
  %store_forwarded121 = phi double [ %load_initial120, %.ph ], [ %161, %143 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %146, %143 ]
  %indvars.iv78 = phi i64 [ 1, %.ph ], [ %indvars.iv.next79, %143 ]
  %144 = fmul double %59, %store_forwarded
  %145 = fadd double %144, %.pre98
  %146 = fdiv double %92, %145
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %indvars.iv78
  store double %146, double* %147, align 8
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %102, i64 %indvars.iv78
  %149 = load double, double* %148, align 8
  %150 = fmul double %77, %149
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv84, i64 %indvars.iv78
  %152 = load double, double* %151, align 8
  %153 = fmul double %94, %152
  %154 = fsub double %153, %150
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv.next85, i64 %indvars.iv78
  %156 = load double, double* %155, align 8
  %157 = fmul double %.pre100, %156
  %158 = fsub double %154, %157
  %159 = fmul double %59, %store_forwarded121
  %160 = fsub double %158, %159
  %161 = fdiv double %160, %145
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %indvars.iv78
  store double %161, double* %162, align 8
  %exitcond81 = icmp eq i64 %indvars.iv78, 998
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  br i1 %exitcond81, label %._crit_edge39.us.loopexit122, label %143

._crit_edge39.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge39.us

._crit_edge39.us.loopexit122:                     ; preds = %143
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.loopexit122, %._crit_edge39.us.loopexit
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv84, i64 999
  store double 1.000000e+00, double* %163, align 8
  br label %.lr.ph42.us

._crit_edge46:                                    ; preds = %._crit_edge43.us
  %164 = icmp slt i32 %16, 500
  %165 = add nuw nsw i32 %16, 1
  br i1 %164, label %.preheader7, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge46
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv8 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next9, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv8, 1000
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge6, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge6 ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge6

; <label>:11:                                     ; preds = %._crit_edge7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge7

._crit_edge.us:                                   ; preds = %._crit_edge6
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
