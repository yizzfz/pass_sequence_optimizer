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
  %indvars.iv7 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next8, %._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv7, 1000
  %2 = trunc i64 %1 to i32
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %3 ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 %2, %4
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 %2, %8
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
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
  br label %.lr.ph29..lr.ph29.split.us_crit_edge

.lr.ph29..lr.ph29.split.us_crit_edge:             ; preds = %._crit_edge46, %.preheader7.lr.ph
  %14 = phi [1000 x double]* [ %1, %.preheader7.lr.ph ], [ %.pre3, %._crit_edge46 ]
  %15 = phi i32 [ 1, %.preheader7.lr.ph ], [ %164, %._crit_edge46 ]
  %16 = phi [1000 x double]* [ %2, %.preheader7.lr.ph ], [ %85, %._crit_edge46 ]
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %._crit_edge27.us..lr.ph29.split.us_crit_edge, %.lr.ph29..lr.ph29.split.us_crit_edge
  %17 = phi [1000 x double]* [ %14, %.lr.ph29..lr.ph29.split.us_crit_edge ], [ %.pre1, %._crit_edge27.us..lr.ph29.split.us_crit_edge ]
  %indvars.iv76 = phi i64 [ 1, %.lr.ph29..lr.ph29.split.us_crit_edge ], [ %indvars.iv.next77, %._crit_edge27.us..lr.ph29.split.us_crit_edge ]
  %18 = phi [1000 x double]* [ %16, %.lr.ph29..lr.ph29.split.us_crit_edge ], [ %85, %._crit_edge27.us..lr.ph29.split.us_crit_edge ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 0, i64 %indvars.iv76
  store double 1.000000e+00, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv76, i64 0
  store double 0.000000e+00, double* %20, align 8
  %21 = load [1000 x double]*, [1000 x double]** %5, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 0, i64 %indvars.iv76
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = load [1000 x double]*, [1000 x double]** %7, align 8
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv76
  %27 = bitcast [1000 x double]* %26 to i64*
  store i64 %24, i64* %27, align 8
  %28 = add nsw i64 %indvars.iv76, -1
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %.pre = load double, double* %8, align 8
  %.pre62 = load double, double* %9, align 8
  br label %48

._crit_edge27.us:                                 ; preds = %.lr.ph26.us
  %exitcond93 = icmp eq i64 %indvars.iv.next77, 999
  br i1 %exitcond93, label %.lr.ph38.us.preheader, label %._crit_edge27.us..lr.ph29.split.us_crit_edge

._crit_edge27.us..lr.ph29.split.us_crit_edge:     ; preds = %._crit_edge27.us
  %.pre1 = load [1000 x double]*, [1000 x double]** %5, align 8
  br label %.lr.ph29.split.us

.lr.ph38.us.preheader:                            ; preds = %._crit_edge27.us
  %.pre2 = load double, double* %12, align 8
  %.pre3 = load [1000 x double]*, [1000 x double]** %5, align 8
  %.pre4 = load double, double* %10, align 8
  %29 = fsub double -0.000000e+00, %74
  %30 = fmul double %79, 2.000000e+00
  %31 = fadd double %30, 1.000000e+00
  br label %.lver.check

.lr.ph26.us:                                      ; preds = %.lr.ph26.us, %._crit_edge.us..lr.ph26.us_crit_edge
  %indvars.iv74 = phi i64 [ 998, %._crit_edge.us..lr.ph26.us_crit_edge ], [ %indvars.iv.next75.1, %.lr.ph26.us ]
  %32 = phi double [ 1.000000e+00, %._crit_edge.us..lr.ph26.us_crit_edge ], [ %45, %.lr.ph26.us ]
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %indvars.iv76, i64 %indvars.iv74
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %32
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv76, i64 %indvars.iv74
  %37 = load double, double* %36, align 8
  %38 = fadd double %35, %37
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 %indvars.iv74, i64 %indvars.iv76
  store double %38, double* %39, align 8
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, -1
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %indvars.iv76, i64 %indvars.iv.next75
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %38
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv76, i64 %indvars.iv.next75
  %44 = load double, double* %43, align 8
  %45 = fadd double %42, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 %indvars.iv.next75, i64 %indvars.iv76
  store double %45, double* %46, align 8
  %47 = icmp sgt i64 %indvars.iv.next75, 1
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, -2
  br i1 %47, label %.lr.ph26.us, label %._crit_edge27.us

; <label>:48:                                     ; preds = %48, %.lr.ph29.split.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %48 ], [ 1, %.lr.ph29.split.us ]
  %49 = phi double [ %89, %48 ], [ %.pre62, %.lr.ph29.split.us ]
  %50 = phi double [ %79, %48 ], [ %.pre, %.lr.ph29.split.us ]
  %51 = phi [1000 x double]* [ %85, %48 ], [ %18, %.lr.ph29.split.us ]
  %52 = load double, double* %10, align 8
  %53 = fsub double -0.000000e+00, %52
  %54 = add nsw i64 %indvars.iv72, -1
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %51, i64 %indvars.iv76, i64 %54
  %56 = load double, double* %55, align 8
  %57 = fmul double %50, %56
  %58 = fadd double %57, %49
  %59 = fdiv double %53, %58
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %51, i64 %indvars.iv76, i64 %indvars.iv72
  store double %59, double* %60, align 8
  %61 = load double, double* %11, align 8
  %62 = load [1000 x double]*, [1000 x double]** %4, align 8
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv72, i64 %28
  %64 = bitcast double* %63 to <2 x double>*
  %65 = fmul double %61, 2.000000e+00
  %66 = fadd double %65, 1.000000e+00
  %67 = load <2 x double>, <2 x double>* %64, align 8
  %68 = insertelement <2 x double> undef, double %61, i32 0
  %69 = insertelement <2 x double> %68, double %66, i32 1
  %70 = fmul <2 x double> %69, %67
  %71 = extractelement <2 x double> %70, i32 0
  %72 = extractelement <2 x double> %70, i32 1
  %73 = fsub double %72, %71
  %74 = load double, double* %13, align 8
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv72, i64 %indvars.iv.next77
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fsub double %73, %77
  %79 = load double, double* %8, align 8
  %80 = load [1000 x double]*, [1000 x double]** %7, align 8
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv76, i64 %54
  %82 = load double, double* %81, align 8
  %83 = fmul double %79, %82
  %84 = fsub double %78, %83
  %85 = load [1000 x double]*, [1000 x double]** %6, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %indvars.iv76, i64 %54
  %87 = load double, double* %86, align 8
  %88 = fmul double %79, %87
  %89 = load double, double* %9, align 8
  %90 = fadd double %88, %89
  %91 = fdiv double %84, %90
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv76, i64 %indvars.iv72
  store double %91, double* %92, align 8
  %exitcond = icmp eq i64 %indvars.iv72, 998
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br i1 %exitcond, label %._crit_edge.us..lr.ph26.us_crit_edge, label %48

._crit_edge.us..lr.ph26.us_crit_edge:             ; preds = %48
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 999, i64 %indvars.iv76
  store double 1.000000e+00, double* %93, align 8
  br label %.lr.ph26.us

.lver.check:                                      ; preds = %._crit_edge43.us, %.lr.ph38.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph38.us.preheader ], [ %94, %._crit_edge43.us ]
  %indvars.iv84 = phi i64 [ 1, %.lr.ph38.us.preheader ], [ %indvars.iv.next85, %._crit_edge43.us ]
  %94 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %85, i64 %94, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %85, i64 %94, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %80, i64 %94, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %80, i64 %94, i64 999
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv84, i64 0
  store double 1.000000e+00, double* %95, align 8
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %indvars.iv84, i64 0
  store double 0.000000e+00, double* %96, align 8
  %97 = bitcast double* %95 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv84
  %100 = bitcast [1000 x double]* %99 to i64*
  store i64 %98, i64* %100, align 8
  %101 = add nsw i64 %indvars.iv84, -1
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %bound0 = icmp ult double* %scevgep, %scevgep20
  %bound1 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv78.lver.orig = phi i64 [ %indvars.iv.next79.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %102 = add nsw i64 %indvars.iv78.lver.orig, -1
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %indvars.iv84, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fmul double %61, %104
  %106 = fadd double %105, %.pre2
  %107 = fdiv double %29, %106
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %107, double* %108, align 8
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre3, i64 %101, i64 %indvars.iv78.lver.orig
  %110 = load double, double* %109, align 8
  %111 = fmul double %79, %110
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre3, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  %113 = load double, double* %112, align 8
  %114 = fmul double %31, %113
  %115 = fsub double %114, %111
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre3, i64 %indvars.iv.next85, i64 %indvars.iv78.lver.orig
  %117 = load double, double* %116, align 8
  %118 = fmul double %.pre4, %117
  %119 = fsub double %115, %118
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv84, i64 %102
  %121 = load double, double* %120, align 8
  %122 = fmul double %61, %121
  %123 = fsub double %119, %122
  %124 = fdiv double %123, %106
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %124, double* %125, align 8
  %exitcond81.lver.orig = icmp eq i64 %indvars.iv78.lver.orig, 998
  %indvars.iv.next79.lver.orig = add nuw nsw i64 %indvars.iv78.lver.orig, 1
  br i1 %exitcond81.lver.orig, label %._crit_edge39.us..lr.ph42.us_crit_edge.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial24 = load double, double* %scevgep18, align 8
  br label %142

._crit_edge43.us:                                 ; preds = %.lr.ph42.us
  %exitcond94 = icmp eq i64 %indvars.iv.next85, 999
  br i1 %exitcond94, label %._crit_edge46, label %.lver.check

.lr.ph42.us:                                      ; preds = %.lr.ph42.us, %._crit_edge39.us..lr.ph42.us_crit_edge
  %indvars.iv82 = phi i64 [ 998, %._crit_edge39.us..lr.ph42.us_crit_edge ], [ %indvars.iv.next83.1, %.lr.ph42.us ]
  %126 = phi double [ 1.000000e+00, %._crit_edge39.us..lr.ph42.us_crit_edge ], [ %139, %.lr.ph42.us ]
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %indvars.iv84, i64 %indvars.iv82
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, %126
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv84, i64 %indvars.iv82
  %131 = load double, double* %130, align 8
  %132 = fadd double %129, %131
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv84, i64 %indvars.iv82
  store double %132, double* %133, align 8
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, -1
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %indvars.iv84, i64 %indvars.iv.next83
  %135 = load double, double* %134, align 8
  %136 = fmul double %135, %132
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv84, i64 %indvars.iv.next83
  %138 = load double, double* %137, align 8
  %139 = fadd double %136, %138
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv84, i64 %indvars.iv.next83
  store double %139, double* %140, align 8
  %141 = icmp sgt i64 %indvars.iv.next83, 1
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82, -2
  br i1 %141, label %.lr.ph42.us, label %._crit_edge43.us

; <label>:142:                                    ; preds = %142, %.ph
  %store_forwarded25 = phi double [ %load_initial24, %.ph ], [ %160, %142 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %145, %142 ]
  %indvars.iv78 = phi i64 [ 1, %.ph ], [ %indvars.iv.next79, %142 ]
  %143 = fmul double %61, %store_forwarded
  %144 = fadd double %143, %.pre2
  %145 = fdiv double %29, %144
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %indvars.iv84, i64 %indvars.iv78
  store double %145, double* %146, align 8
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre3, i64 %101, i64 %indvars.iv78
  %148 = load double, double* %147, align 8
  %149 = fmul double %79, %148
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre3, i64 %indvars.iv84, i64 %indvars.iv78
  %151 = load double, double* %150, align 8
  %152 = fmul double %31, %151
  %153 = fsub double %152, %149
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre3, i64 %indvars.iv.next85, i64 %indvars.iv78
  %155 = load double, double* %154, align 8
  %156 = fmul double %.pre4, %155
  %157 = fsub double %153, %156
  %158 = fmul double %61, %store_forwarded25
  %159 = fsub double %157, %158
  %160 = fdiv double %159, %144
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %indvars.iv84, i64 %indvars.iv78
  store double %160, double* %161, align 8
  %exitcond81 = icmp eq i64 %indvars.iv78, 998
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  br i1 %exitcond81, label %._crit_edge39.us..lr.ph42.us_crit_edge.loopexit26, label %142

._crit_edge39.us..lr.ph42.us_crit_edge.loopexit:  ; preds = %.ph.lver.orig
  br label %._crit_edge39.us..lr.ph42.us_crit_edge

._crit_edge39.us..lr.ph42.us_crit_edge.loopexit26: ; preds = %142
  br label %._crit_edge39.us..lr.ph42.us_crit_edge

._crit_edge39.us..lr.ph42.us_crit_edge:           ; preds = %._crit_edge39.us..lr.ph42.us_crit_edge.loopexit26, %._crit_edge39.us..lr.ph42.us_crit_edge.loopexit
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv84, i64 999
  store double 1.000000e+00, double* %162, align 8
  br label %.lr.ph42.us

._crit_edge46:                                    ; preds = %._crit_edge43.us
  %163 = icmp slt i32 %15, 500
  %164 = add nuw nsw i32 %15, 1
  br i1 %163, label %.lr.ph29..lr.ph29.split.us_crit_edge, label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge46
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

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv8 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next9, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv8, 1000
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge6, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge6 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge6

; <label>:10:                                     ; preds = %._crit_edge7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge7, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge7

._crit_edge.us:                                   ; preds = %._crit_edge6
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
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
