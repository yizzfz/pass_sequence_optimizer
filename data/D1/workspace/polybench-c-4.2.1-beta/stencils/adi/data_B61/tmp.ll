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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv8 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next9, %._crit_edge.us ]
  %1 = trunc i64 %indvars.iv8 to i32
  br label %2

; <label>:2:                                      ; preds = %2, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %2 ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = sub nuw nsw i32 1000, %3
  %5 = add nuw nsw i32 %4, %1
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 1000, %8
  %10 = add nuw nsw i32 %9, %1
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %2

._crit_edge.us:                                   ; preds = %2
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
.preheader7.lr.ph:
  %4 = alloca [1000 x double]*, align 8
  %5 = alloca [1000 x double]*, align 8
  %6 = alloca [1000 x double]*, align 8
  %7 = alloca [1000 x double]*, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  store [1000 x double]* %0, [1000 x double]** %4, align 8
  store [1000 x double]* %1, [1000 x double]** %5, align 8
  store [1000 x double]* %2, [1000 x double]** %6, align 8
  store [1000 x double]* %3, [1000 x double]** %7, align 8
  store double 0xC09F400000000001, double* %8, align 8
  store double 0xC09F400000000001, double* %10, align 8
  store double 0xC08F400000000001, double* %11, align 8
  store double 0x40AF420000000001, double* %9, align 8
  store double 0x409F440000000001, double* %12, align 8
  store double 0xC08F400000000001, double* %13, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge46, %.preheader7.lr.ph
  %14 = phi i32 [ 1, %.preheader7.lr.ph ], [ %163, %._crit_edge46 ]
  %15 = phi [1000 x double]* [ %2, %.preheader7.lr.ph ], [ %81, %._crit_edge46 ]
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %._crit_edge27.us, %.preheader7
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge27.us ], [ 1, %.preheader7 ]
  %16 = phi [1000 x double]* [ %81, %._crit_edge27.us ], [ %15, %.preheader7 ]
  %17 = load [1000 x double]*, [1000 x double]** %5, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 0, i64 %indvars.iv74
  store double 1.000000e+00, double* %18, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %16, i64 %indvars.iv74, i64 0
  store double 0.000000e+00, double* %19, align 8
  %20 = load [1000 x double]*, [1000 x double]** %5, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 0, i64 %indvars.iv74
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = load [1000 x double]*, [1000 x double]** %7, align 8
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv74
  %26 = bitcast [1000 x double]* %25 to i64*
  store i64 %23, i64* %26, align 8
  %27 = add nsw i64 %indvars.iv74, -1
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %.pre60 = load double, double* %8, align 8
  %.pre61 = load double, double* %9, align 8
  br label %44

._crit_edge27.us:                                 ; preds = %.lr.ph26.us
  %exitcond94 = icmp eq i64 %indvars.iv.next75, 999
  br i1 %exitcond94, label %.lr.ph38.us.preheader, label %.lr.ph29.split.us

.lr.ph26.us:                                      ; preds = %.lr.ph26.us, %._crit_edge.us
  %indvars.iv72 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next73.1, %.lr.ph26.us ]
  %28 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %41, %.lr.ph26.us ]
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv74, i64 %indvars.iv72
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %28
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv74, i64 %indvars.iv72
  %33 = load double, double* %32, align 8
  %34 = fadd double %31, %33
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv72, i64 %indvars.iv74
  store double %34, double* %35, align 8
  %indvars.iv.next73 = add nsw i64 %indvars.iv72, -1
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv74, i64 %indvars.iv.next73
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %34
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv74, i64 %indvars.iv.next73
  %40 = load double, double* %39, align 8
  %41 = fadd double %38, %40
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv.next73, i64 %indvars.iv74
  store double %41, double* %42, align 8
  %43 = icmp sgt i64 %indvars.iv.next73, 1
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, -2
  br i1 %43, label %.lr.ph26.us, label %._crit_edge27.us

; <label>:44:                                     ; preds = %44, %.lr.ph29.split.us
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %44 ], [ 1, %.lr.ph29.split.us ]
  %45 = phi double [ %85, %44 ], [ %.pre61, %.lr.ph29.split.us ]
  %46 = phi double [ %75, %44 ], [ %.pre60, %.lr.ph29.split.us ]
  %47 = phi [1000 x double]* [ %81, %44 ], [ %16, %.lr.ph29.split.us ]
  %48 = load double, double* %10, align 8
  %49 = fsub double -0.000000e+00, %48
  %50 = add nsw i64 %indvars.iv70, -1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv74, i64 %50
  %52 = load double, double* %51, align 8
  %53 = fmul double %46, %52
  %54 = fadd double %53, %45
  %55 = fdiv double %49, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv74, i64 %indvars.iv70
  store double %55, double* %56, align 8
  %57 = load double, double* %11, align 8
  %58 = load [1000 x double]*, [1000 x double]** %4, align 8
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv70, i64 %27
  %60 = bitcast double* %59 to <2 x double>*
  %61 = fmul double %57, 2.000000e+00
  %62 = fadd double %61, 1.000000e+00
  %63 = load <2 x double>, <2 x double>* %60, align 8
  %64 = insertelement <2 x double> undef, double %57, i32 0
  %65 = insertelement <2 x double> %64, double %62, i32 1
  %66 = fmul <2 x double> %65, %63
  %67 = extractelement <2 x double> %66, i32 0
  %68 = extractelement <2 x double> %66, i32 1
  %69 = fsub double %68, %67
  %70 = load double, double* %13, align 8
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv70, i64 %indvars.iv.next75
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fsub double %69, %73
  %75 = load double, double* %8, align 8
  %76 = load [1000 x double]*, [1000 x double]** %7, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv74, i64 %50
  %78 = load double, double* %77, align 8
  %79 = fmul double %75, %78
  %80 = fsub double %74, %79
  %81 = load [1000 x double]*, [1000 x double]** %6, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv74, i64 %50
  %83 = load double, double* %82, align 8
  %84 = fmul double %75, %83
  %85 = load double, double* %9, align 8
  %86 = fadd double %84, %85
  %87 = fdiv double %80, %86
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv74, i64 %indvars.iv70
  store double %87, double* %88, align 8
  %exitcond = icmp eq i64 %indvars.iv70, 998
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  br i1 %exitcond, label %._crit_edge.us, label %44

._crit_edge.us:                                   ; preds = %44
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 999, i64 %indvars.iv74
  store double 1.000000e+00, double* %89, align 8
  br label %.lr.ph26.us

.lr.ph38.us.preheader:                            ; preds = %._crit_edge27.us
  %.pre = load double, double* %12, align 8
  %.pre96 = load [1000 x double]*, [1000 x double]** %5, align 8
  %.pre97 = load double, double* %10, align 8
  %90 = fsub double -0.000000e+00, %70
  %91 = fmul double %75, 2.000000e+00
  %92 = fadd double %91, 1.000000e+00
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge43.us, %.lr.ph38.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph38.us.preheader ], [ %93, %._crit_edge43.us ]
  %indvars.iv82 = phi i64 [ 1, %.lr.ph38.us.preheader ], [ %indvars.iv.next83, %._crit_edge43.us ]
  %93 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %81, i64 %93, i64 0
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %81, i64 %93, i64 999
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %76, i64 %93, i64 0
  %scevgep11 = getelementptr [1000 x double], [1000 x double]* %76, i64 %93, i64 999
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv82, i64 0
  store double 1.000000e+00, double* %94, align 8
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv82, i64 0
  store double 0.000000e+00, double* %95, align 8
  %96 = bitcast double* %94 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv82
  %99 = bitcast [1000 x double]* %98 to i64*
  store i64 %97, i64* %99, align 8
  %100 = add nsw i64 %indvars.iv82, -1
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %bound0 = icmp ult double* %scevgep, %scevgep11
  %bound1 = icmp ult double* %scevgep9, %scevgep7
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv76.lver.orig = phi i64 [ %indvars.iv.next77.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %101 = add nsw i64 %indvars.iv76.lver.orig, -1
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv82, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fmul double %57, %103
  %105 = fadd double %104, %.pre
  %106 = fdiv double %90, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv82, i64 %indvars.iv76.lver.orig
  store double %106, double* %107, align 8
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre96, i64 %100, i64 %indvars.iv76.lver.orig
  %109 = load double, double* %108, align 8
  %110 = fmul double %75, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre96, i64 %indvars.iv82, i64 %indvars.iv76.lver.orig
  %112 = load double, double* %111, align 8
  %113 = fmul double %92, %112
  %114 = fsub double %113, %110
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre96, i64 %indvars.iv.next83, i64 %indvars.iv76.lver.orig
  %116 = load double, double* %115, align 8
  %117 = fmul double %.pre97, %116
  %118 = fsub double %114, %117
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv82, i64 %101
  %120 = load double, double* %119, align 8
  %121 = fmul double %57, %120
  %122 = fsub double %118, %121
  %123 = fdiv double %122, %105
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv82, i64 %indvars.iv76.lver.orig
  store double %123, double* %124, align 8
  %exitcond79.lver.orig = icmp eq i64 %indvars.iv76.lver.orig, 998
  %indvars.iv.next77.lver.orig = add nuw nsw i64 %indvars.iv76.lver.orig, 1
  br i1 %exitcond79.lver.orig, label %._crit_edge39.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial15 = load double, double* %scevgep9, align 8
  br label %141

._crit_edge43.us:                                 ; preds = %.lr.ph42.us
  %exitcond95 = icmp eq i64 %indvars.iv.next83, 999
  br i1 %exitcond95, label %._crit_edge46, label %.lver.check

.lr.ph42.us:                                      ; preds = %.lr.ph42.us, %._crit_edge39.us
  %indvars.iv80 = phi i64 [ 998, %._crit_edge39.us ], [ %indvars.iv.next81.1, %.lr.ph42.us ]
  %125 = phi double [ 1.000000e+00, %._crit_edge39.us ], [ %138, %.lr.ph42.us ]
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv82, i64 %indvars.iv80
  %127 = load double, double* %126, align 8
  %128 = fmul double %127, %125
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv82, i64 %indvars.iv80
  %130 = load double, double* %129, align 8
  %131 = fadd double %128, %130
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv82, i64 %indvars.iv80
  store double %131, double* %132, align 8
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, -1
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv82, i64 %indvars.iv.next81
  %134 = load double, double* %133, align 8
  %135 = fmul double %134, %131
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv82, i64 %indvars.iv.next81
  %137 = load double, double* %136, align 8
  %138 = fadd double %135, %137
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv82, i64 %indvars.iv.next81
  store double %138, double* %139, align 8
  %140 = icmp sgt i64 %indvars.iv.next81, 1
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, -2
  br i1 %140, label %.lr.ph42.us, label %._crit_edge43.us

; <label>:141:                                    ; preds = %141, %.ph
  %store_forwarded16 = phi double [ %load_initial15, %.ph ], [ %159, %141 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %144, %141 ]
  %indvars.iv76 = phi i64 [ 1, %.ph ], [ %indvars.iv.next77, %141 ]
  %142 = fmul double %57, %store_forwarded
  %143 = fadd double %142, %.pre
  %144 = fdiv double %90, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv82, i64 %indvars.iv76
  store double %144, double* %145, align 8
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre96, i64 %100, i64 %indvars.iv76
  %147 = load double, double* %146, align 8
  %148 = fmul double %75, %147
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre96, i64 %indvars.iv82, i64 %indvars.iv76
  %150 = load double, double* %149, align 8
  %151 = fmul double %92, %150
  %152 = fsub double %151, %148
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre96, i64 %indvars.iv.next83, i64 %indvars.iv76
  %154 = load double, double* %153, align 8
  %155 = fmul double %.pre97, %154
  %156 = fsub double %152, %155
  %157 = fmul double %57, %store_forwarded16
  %158 = fsub double %156, %157
  %159 = fdiv double %158, %143
  %160 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv82, i64 %indvars.iv76
  store double %159, double* %160, align 8
  %exitcond79 = icmp eq i64 %indvars.iv76, 998
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  br i1 %exitcond79, label %._crit_edge39.us.loopexit34, label %141

._crit_edge39.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge39.us

._crit_edge39.us.loopexit34:                      ; preds = %141
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.loopexit34, %._crit_edge39.us.loopexit
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv82, i64 999
  store double 1.000000e+00, double* %161, align 8
  br label %.lr.ph42.us

._crit_edge46:                                    ; preds = %._crit_edge43.us
  %162 = icmp slt i32 %14, 500
  %163 = add nuw nsw i32 %14, 1
  br i1 %162, label %.preheader7, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge46
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
..preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge2.us, %..preheader.us_crit_edge
  %indvars.iv7 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next8, %._crit_edge2.us ]
  %5 = mul nuw nsw i64 %indvars.iv7, 1000
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge2.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
