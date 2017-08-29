; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1000 x double]*) #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv6 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next7, %._crit_edge.us ]
  %1 = trunc i64 %indvars.iv6 to i32
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge10 ]
  %2 = trunc i64 %indvars.iv to i32
  %3 = sub nuw nsw i32 1000, %2
  %4 = add nuw nsw i32 %3, %1
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %8 = sub nuw nsw i32 1000, %7
  %9 = add nuw nsw i32 %8, %1
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %5, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %6 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge10

._crit_edge.us:                                   ; preds = %._crit_edge10
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond9, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) #0 {
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
  store double 0x40AF420000000001, double* %9, align 8
  store double 0xC09F400000000001, double* %10, align 8
  store double 0xC08F400000000001, double* %11, align 8
  store double 0x409F440000000001, double* %12, align 8
  store double 0xC08F400000000001, double* %13, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge47, %.preheader7.lr.ph
  %14 = phi [1000 x double]* [ %1, %.preheader7.lr.ph ], [ %99, %._crit_edge47 ]
  %15 = phi i32 [ 1, %.preheader7.lr.ph ], [ %164, %._crit_edge47 ]
  %16 = phi [1000 x double]* [ %2, %.preheader7.lr.ph ], [ %81, %._crit_edge47 ]
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %._crit_edge27.us..lr.ph29.split.us_crit_edge, %.preheader7
  %17 = phi [1000 x double]* [ %.pre19, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ %14, %.preheader7 ]
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ 1, %.preheader7 ]
  %18 = phi [1000 x double]* [ %81, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ %16, %.preheader7 ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 0, i64 %indvars.iv78
  store double 1.000000e+00, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv78, i64 0
  store double 0.000000e+00, double* %20, align 8
  %21 = load [1000 x double]*, [1000 x double]** %5, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 0, i64 %indvars.iv78
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = load [1000 x double]*, [1000 x double]** %7, align 8
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv78
  %27 = bitcast [1000 x double]* %26 to i64*
  store i64 %24, i64* %27, align 8
  %28 = add nsw i64 %indvars.iv78, -1
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %.pre = load double, double* %8, align 8
  %.pre62 = load double, double* %9, align 8
  br label %._crit_edge93

._crit_edge27.us:                                 ; preds = %.lr.ph26.us
  %exitcond81 = icmp eq i64 %indvars.iv.next79, 999
  br i1 %exitcond81, label %._crit_edge94.lver.check.preheader, label %._crit_edge27.us..lr.ph29.split.us_crit_edge

._crit_edge27.us..lr.ph29.split.us_crit_edge:     ; preds = %._crit_edge27.us
  %.pre19 = load [1000 x double]*, [1000 x double]** %5, align 8
  br label %.lr.ph29.split.us

._crit_edge94.lver.check.preheader:               ; preds = %._crit_edge27.us
  br label %._crit_edge94.lver.check

.lr.ph26.us:                                      ; preds = %.lr.ph26.us, %._crit_edge.us
  %indvars.iv76 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next77.1, %.lr.ph26.us ]
  %29 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %42, %.lr.ph26.us ]
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv78, i64 %indvars.iv76
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %29
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv78, i64 %indvars.iv76
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 %indvars.iv76, i64 %indvars.iv78
  store double %35, double* %36, align 8
  %indvars.iv.next77 = add nsw i64 %indvars.iv76, -1
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv78, i64 %indvars.iv.next77
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %35
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv78, i64 %indvars.iv.next77
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 %indvars.iv.next77, i64 %indvars.iv78
  store double %42, double* %43, align 8
  %44 = icmp sgt i64 %indvars.iv.next77, 1
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, -2
  br i1 %44, label %.lr.ph26.us, label %._crit_edge27.us

._crit_edge93:                                    ; preds = %._crit_edge93, %.lr.ph29.split.us
  %indvars.iv72 = phi i64 [ 1, %.lr.ph29.split.us ], [ %indvars.iv.next73, %._crit_edge93 ]
  %45 = phi double [ %.pre62, %.lr.ph29.split.us ], [ %85, %._crit_edge93 ]
  %46 = phi double [ %.pre, %.lr.ph29.split.us ], [ %75, %._crit_edge93 ]
  %47 = phi [1000 x double]* [ %18, %.lr.ph29.split.us ], [ %81, %._crit_edge93 ]
  %48 = load double, double* %10, align 8
  %49 = fsub double -0.000000e+00, %48
  %50 = add nsw i64 %indvars.iv72, -1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv78, i64 %50
  %52 = load double, double* %51, align 8
  %53 = fmul double %46, %52
  %54 = fadd double %53, %45
  %55 = fdiv double %49, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv78, i64 %indvars.iv72
  store double %55, double* %56, align 8
  %57 = load double, double* %11, align 8
  %58 = load [1000 x double]*, [1000 x double]** %4, align 8
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv72, i64 %28
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
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv72, i64 %indvars.iv.next79
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fsub double %69, %73
  %75 = load double, double* %8, align 8
  %76 = load [1000 x double]*, [1000 x double]** %7, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv78, i64 %50
  %78 = load double, double* %77, align 8
  %79 = fmul double %75, %78
  %80 = fsub double %74, %79
  %81 = load [1000 x double]*, [1000 x double]** %6, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv78, i64 %50
  %83 = load double, double* %82, align 8
  %84 = fmul double %75, %83
  %85 = load double, double* %9, align 8
  %86 = fadd double %84, %85
  %87 = fdiv double %80, %86
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv78, i64 %indvars.iv72
  store double %87, double* %88, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 999
  br i1 %exitcond75, label %._crit_edge.us, label %._crit_edge93

._crit_edge.us:                                   ; preds = %._crit_edge93
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 999, i64 %indvars.iv78
  store double 1.000000e+00, double* %89, align 8
  br label %.lr.ph26.us

._crit_edge94.lver.check:                         ; preds = %._crit_edge94.lver.check.preheader, %._crit_edge44.us
  %indvar = phi i64 [ %90, %._crit_edge44.us ], [ 0, %._crit_edge94.lver.check.preheader ]
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %._crit_edge44.us ], [ 1, %._crit_edge94.lver.check.preheader ]
  %90 = add i64 %indvar, 1
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv88, i64 0
  store double 1.000000e+00, double* %91, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv88, i64 0
  store double 0.000000e+00, double* %92, align 8
  %93 = bitcast double* %91 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv88
  %96 = bitcast [1000 x double]* %95 to i64*
  store i64 %94, i64* %96, align 8
  %97 = fsub double -0.000000e+00, %70
  %98 = load double, double* %12, align 8
  %99 = load [1000 x double]*, [1000 x double]** %5, align 8
  %100 = add nsw i64 %indvars.iv88, -1
  %101 = fmul double %75, 2.000000e+00
  %102 = fadd double %101, 1.000000e+00
  %103 = load double, double* %10, align 8
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %81, i64 %90, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %81, i64 %90, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %76, i64 %90, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %76, i64 %90, i64 999
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge94.lver.orig.preheader, label %._crit_edge94.ph

._crit_edge94.lver.orig.preheader:                ; preds = %._crit_edge94.lver.check
  br label %._crit_edge94.lver.orig

._crit_edge94.lver.orig:                          ; preds = %._crit_edge94.lver.orig.preheader, %._crit_edge94.lver.orig
  %indvars.iv82.lver.orig = phi i64 [ %indvars.iv.next83.lver.orig, %._crit_edge94.lver.orig ], [ 1, %._crit_edge94.lver.orig.preheader ]
  %104 = add nsw i64 %indvars.iv82.lver.orig, -1
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv88, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fmul double %57, %106
  %108 = fadd double %107, %98
  %109 = fdiv double %97, %108
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv88, i64 %indvars.iv82.lver.orig
  store double %109, double* %110, align 8
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %100, i64 %indvars.iv82.lver.orig
  %112 = load double, double* %111, align 8
  %113 = fmul double %75, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv88, i64 %indvars.iv82.lver.orig
  %115 = load double, double* %114, align 8
  %116 = fmul double %102, %115
  %117 = fsub double %116, %113
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv.next89, i64 %indvars.iv82.lver.orig
  %119 = load double, double* %118, align 8
  %120 = fmul double %103, %119
  %121 = fsub double %117, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv88, i64 %104
  %123 = load double, double* %122, align 8
  %124 = fmul double %57, %123
  %125 = fsub double %121, %124
  %126 = fdiv double %125, %108
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv88, i64 %indvars.iv82.lver.orig
  store double %126, double* %127, align 8
  %indvars.iv.next83.lver.orig = add nuw nsw i64 %indvars.iv82.lver.orig, 1
  %exitcond85.lver.orig = icmp eq i64 %indvars.iv.next83.lver.orig, 999
  br i1 %exitcond85.lver.orig, label %._crit_edge39.us.loopexit, label %._crit_edge94.lver.orig

._crit_edge94.ph:                                 ; preds = %._crit_edge94.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial10 = load double, double* %scevgep4, align 8
  br label %._crit_edge94

._crit_edge44.us:                                 ; preds = %.lr.ph43.us
  %exitcond91 = icmp eq i64 %indvars.iv.next89, 999
  br i1 %exitcond91, label %._crit_edge47, label %._crit_edge94.lver.check

.lr.ph43.us:                                      ; preds = %.lr.ph43.us, %._crit_edge39.us
  %indvars.iv86 = phi i64 [ 998, %._crit_edge39.us ], [ %indvars.iv.next87.1, %.lr.ph43.us ]
  %128 = phi double [ 1.000000e+00, %._crit_edge39.us ], [ %141, %.lr.ph43.us ]
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv88, i64 %indvars.iv86
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, %128
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv88, i64 %indvars.iv86
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv88, i64 %indvars.iv86
  store double %134, double* %135, align 8
  %indvars.iv.next87 = add nsw i64 %indvars.iv86, -1
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv88, i64 %indvars.iv.next87
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, %134
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv88, i64 %indvars.iv.next87
  %140 = load double, double* %139, align 8
  %141 = fadd double %138, %140
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv88, i64 %indvars.iv.next87
  store double %141, double* %142, align 8
  %143 = icmp sgt i64 %indvars.iv.next87, 1
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, -2
  br i1 %143, label %.lr.ph43.us, label %._crit_edge44.us

._crit_edge94:                                    ; preds = %._crit_edge94, %._crit_edge94.ph
  %store_forwarded11 = phi double [ %load_initial10, %._crit_edge94.ph ], [ %161, %._crit_edge94 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge94.ph ], [ %146, %._crit_edge94 ]
  %indvars.iv82 = phi i64 [ 1, %._crit_edge94.ph ], [ %indvars.iv.next83, %._crit_edge94 ]
  %144 = fmul double %57, %store_forwarded
  %145 = fadd double %144, %98
  %146 = fdiv double %97, %145
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv88, i64 %indvars.iv82
  store double %146, double* %147, align 8
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %100, i64 %indvars.iv82
  %149 = load double, double* %148, align 8
  %150 = fmul double %75, %149
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv88, i64 %indvars.iv82
  %152 = load double, double* %151, align 8
  %153 = fmul double %102, %152
  %154 = fsub double %153, %150
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv.next89, i64 %indvars.iv82
  %156 = load double, double* %155, align 8
  %157 = fmul double %103, %156
  %158 = fsub double %154, %157
  %159 = fmul double %57, %store_forwarded11
  %160 = fsub double %158, %159
  %161 = fdiv double %160, %145
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv88, i64 %indvars.iv82
  store double %161, double* %162, align 8
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, 999
  br i1 %exitcond85, label %._crit_edge39.us.loopexit12, label %._crit_edge94

._crit_edge39.us.loopexit:                        ; preds = %._crit_edge94.lver.orig
  br label %._crit_edge39.us

._crit_edge39.us.loopexit12:                      ; preds = %._crit_edge94
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.loopexit12, %._crit_edge39.us.loopexit
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv88, i64 999
  store double 1.000000e+00, double* %163, align 8
  br label %.lr.ph43.us

._crit_edge47:                                    ; preds = %._crit_edge44.us
  %exitcond92 = icmp eq i32 %15, 500
  %164 = add nuw nsw i32 %15, 1
  br i1 %exitcond92, label %._crit_edge, label %.preheader7

._crit_edge:                                      ; preds = %._crit_edge47
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1000 x double]*) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv6, 1000
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge10, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge10 ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge10

; <label>:10:                                     ; preds = %._crit_edge11
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge11, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge10
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond9, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
