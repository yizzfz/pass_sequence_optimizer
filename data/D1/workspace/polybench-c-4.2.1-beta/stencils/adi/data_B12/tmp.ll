; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
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
  tail call void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call void @print_array(i32 1000, [1000 x double]* %7)
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
define internal void @init_array(i32, [1000 x double]*) #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv7 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next8, %._crit_edge.us ]
  %2 = trunc i64 %indvars.iv7 to i32
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge11 ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = sub nuw nsw i32 1000, %3
  %5 = add nuw nsw i32 %4, %2
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 1000, %8
  %10 = add nuw nsw i32 %9, %2
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge11
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) #0 {
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
  store double 0x40AF420000000001, double* %11, align 8
  store double 0xC09F400000000001, double* %12, align 8
  store double 0xC08F400000000001, double* %13, align 8
  store double 0x409F440000000001, double* %14, align 8
  store double 0xC08F400000000001, double* %15, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge46, %.preheader7.lr.ph
  %16 = phi [1000 x double]* [ %3, %.preheader7.lr.ph ], [ %33, %._crit_edge46 ]
  %17 = phi i32 [ 1, %.preheader7.lr.ph ], [ %166, %._crit_edge46 ]
  %18 = phi [1000 x double]* [ %4, %.preheader7.lr.ph ], [ %89, %._crit_edge46 ]
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %._crit_edge27.us..lr.ph29.split.us_crit_edge, %.preheader7
  %19 = phi [1000 x double]* [ %.pre122, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ %16, %.preheader7 ]
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ 1, %.preheader7 ]
  %20 = phi [1000 x double]* [ %89, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ %18, %.preheader7 ]
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv77
  store double 1.000000e+00, double* %21, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv77, i64 0
  store double 0.000000e+00, double* %22, align 8
  %23 = load [1000 x double]*, [1000 x double]** %7, align 8
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 0, i64 %indvars.iv77
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = load [1000 x double]*, [1000 x double]** %9, align 8
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 %indvars.iv77
  %29 = bitcast [1000 x double]* %28 to i64*
  store i64 %26, i64* %29, align 8
  %30 = add nsw i64 %indvars.iv77, -1
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %.pre = load double, double* %10, align 8
  %.pre61 = load double, double* %11, align 8
  br label %._crit_edge92

._crit_edge27.us:                                 ; preds = %.lr.ph26.us
  %exitcond80 = icmp eq i64 %indvars.iv.next78, 999
  br i1 %exitcond80, label %._crit_edge93.lver.check.preheader, label %._crit_edge27.us..lr.ph29.split.us_crit_edge

._crit_edge27.us..lr.ph29.split.us_crit_edge:     ; preds = %._crit_edge27.us
  %.pre122 = load [1000 x double]*, [1000 x double]** %7, align 8
  br label %.lr.ph29.split.us

._crit_edge93.lver.check.preheader:               ; preds = %._crit_edge27.us
  %31 = fsub double -0.000000e+00, %78
  %32 = load double, double* %14, align 8
  %33 = load [1000 x double]*, [1000 x double]** %7, align 8
  %34 = fmul double %83, 2.000000e+00
  %35 = fadd double %34, 1.000000e+00
  %36 = load double, double* %12, align 8
  br label %._crit_edge93.lver.check

.lr.ph26.us:                                      ; preds = %.lr.ph26.us, %._crit_edge.us
  %indvars.iv75 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next76.1, %.lr.ph26.us ]
  %37 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %50, %.lr.ph26.us ]
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %indvars.iv77, i64 %indvars.iv75
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %37
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv77, i64 %indvars.iv75
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 %indvars.iv75, i64 %indvars.iv77
  store double %43, double* %44, align 8
  %indvars.iv.next76 = add nsw i64 %indvars.iv75, -1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %indvars.iv77, i64 %indvars.iv.next76
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %43
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv77, i64 %indvars.iv.next76
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 %indvars.iv.next76, i64 %indvars.iv77
  store double %50, double* %51, align 8
  %52 = icmp sgt i64 %indvars.iv.next76, 1
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, -2
  br i1 %52, label %.lr.ph26.us, label %._crit_edge27.us

._crit_edge92:                                    ; preds = %._crit_edge92, %.lr.ph29.split.us
  %indvars.iv71 = phi i64 [ 1, %.lr.ph29.split.us ], [ %indvars.iv.next72, %._crit_edge92 ]
  %53 = phi double [ %.pre61, %.lr.ph29.split.us ], [ %93, %._crit_edge92 ]
  %54 = phi double [ %.pre, %.lr.ph29.split.us ], [ %83, %._crit_edge92 ]
  %55 = phi [1000 x double]* [ %20, %.lr.ph29.split.us ], [ %89, %._crit_edge92 ]
  %56 = load double, double* %12, align 8
  %57 = fsub double -0.000000e+00, %56
  %58 = add nsw i64 %indvars.iv71, -1
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %55, i64 %indvars.iv77, i64 %58
  %60 = load double, double* %59, align 8
  %61 = fmul double %54, %60
  %62 = fadd double %61, %53
  %63 = fdiv double %57, %62
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %55, i64 %indvars.iv77, i64 %indvars.iv71
  store double %63, double* %64, align 8
  %65 = load double, double* %13, align 8
  %66 = load [1000 x double]*, [1000 x double]** %6, align 8
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv71, i64 %30
  %68 = bitcast double* %67 to <2 x double>*
  %69 = fmul double %65, 2.000000e+00
  %70 = fadd double %69, 1.000000e+00
  %71 = load <2 x double>, <2 x double>* %68, align 8
  %72 = insertelement <2 x double> undef, double %65, i32 0
  %73 = insertelement <2 x double> %72, double %70, i32 1
  %74 = fmul <2 x double> %73, %71
  %75 = extractelement <2 x double> %74, i32 0
  %76 = extractelement <2 x double> %74, i32 1
  %77 = fsub double %76, %75
  %78 = load double, double* %15, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv71, i64 %indvars.iv.next78
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fsub double %77, %81
  %83 = load double, double* %10, align 8
  %84 = load [1000 x double]*, [1000 x double]** %9, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv77, i64 %58
  %86 = load double, double* %85, align 8
  %87 = fmul double %83, %86
  %88 = fsub double %82, %87
  %89 = load [1000 x double]*, [1000 x double]** %8, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %indvars.iv77, i64 %58
  %91 = load double, double* %90, align 8
  %92 = fmul double %83, %91
  %93 = load double, double* %11, align 8
  %94 = fadd double %92, %93
  %95 = fdiv double %88, %94
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv77, i64 %indvars.iv71
  store double %95, double* %96, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 999
  br i1 %exitcond74, label %._crit_edge.us, label %._crit_edge92

._crit_edge.us:                                   ; preds = %._crit_edge92
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 999, i64 %indvars.iv77
  store double 1.000000e+00, double* %97, align 8
  br label %.lr.ph26.us

._crit_edge93.lver.check:                         ; preds = %._crit_edge93.lver.check.preheader, %._crit_edge43.us
  %indvar = phi i64 [ %98, %._crit_edge43.us ], [ 0, %._crit_edge93.lver.check.preheader ]
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge43.us ], [ 1, %._crit_edge93.lver.check.preheader ]
  %98 = add i64 %indvar, 1
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv87, i64 0
  store double 1.000000e+00, double* %99, align 8
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %indvars.iv87, i64 0
  store double 0.000000e+00, double* %100, align 8
  %101 = bitcast double* %99 to i64*
  %102 = load i64, i64* %101, align 8
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv87
  %104 = bitcast [1000 x double]* %103 to i64*
  store i64 %102, i64* %104, align 8
  %105 = add nsw i64 %indvars.iv87, -1
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %89, i64 %98, i64 0
  %scevgep105 = getelementptr [1000 x double], [1000 x double]* %89, i64 %98, i64 999
  %scevgep107 = getelementptr [1000 x double], [1000 x double]* %84, i64 %98, i64 0
  %scevgep109 = getelementptr [1000 x double], [1000 x double]* %84, i64 %98, i64 999
  %bound0 = icmp ult double* %scevgep, %scevgep109
  %bound1 = icmp ult double* %scevgep107, %scevgep105
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge93.lver.orig.preheader, label %._crit_edge93.ph

._crit_edge93.lver.orig.preheader:                ; preds = %._crit_edge93.lver.check
  br label %._crit_edge93.lver.orig

._crit_edge93.lver.orig:                          ; preds = %._crit_edge93.lver.orig.preheader, %._crit_edge93.lver.orig
  %indvars.iv81.lver.orig = phi i64 [ %indvars.iv.next82.lver.orig, %._crit_edge93.lver.orig ], [ 1, %._crit_edge93.lver.orig.preheader ]
  %106 = add nsw i64 %indvars.iv81.lver.orig, -1
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %indvars.iv87, i64 %106
  %108 = load double, double* %107, align 8
  %109 = fmul double %65, %108
  %110 = fadd double %109, %32
  %111 = fdiv double %31, %110
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %indvars.iv87, i64 %indvars.iv81.lver.orig
  store double %111, double* %112, align 8
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %105, i64 %indvars.iv81.lver.orig
  %114 = load double, double* %113, align 8
  %115 = fmul double %83, %114
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %indvars.iv87, i64 %indvars.iv81.lver.orig
  %117 = load double, double* %116, align 8
  %118 = fmul double %35, %117
  %119 = fsub double %118, %115
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %indvars.iv.next88, i64 %indvars.iv81.lver.orig
  %121 = load double, double* %120, align 8
  %122 = fmul double %36, %121
  %123 = fsub double %119, %122
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv87, i64 %106
  %125 = load double, double* %124, align 8
  %126 = fmul double %65, %125
  %127 = fsub double %123, %126
  %128 = fdiv double %127, %110
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv87, i64 %indvars.iv81.lver.orig
  store double %128, double* %129, align 8
  %indvars.iv.next82.lver.orig = add nuw nsw i64 %indvars.iv81.lver.orig, 1
  %exitcond84.lver.orig = icmp eq i64 %indvars.iv.next82.lver.orig, 999
  br i1 %exitcond84.lver.orig, label %._crit_edge39.us.loopexit, label %._crit_edge93.lver.orig

._crit_edge93.ph:                                 ; preds = %._crit_edge93.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial113 = load double, double* %scevgep107, align 8
  br label %._crit_edge93

._crit_edge43.us:                                 ; preds = %.lr.ph42.us
  %exitcond90 = icmp eq i64 %indvars.iv.next88, 999
  br i1 %exitcond90, label %._crit_edge46, label %._crit_edge93.lver.check

.lr.ph42.us:                                      ; preds = %.lr.ph42.us, %._crit_edge39.us
  %indvars.iv85 = phi i64 [ 998, %._crit_edge39.us ], [ %indvars.iv.next86.1, %.lr.ph42.us ]
  %130 = phi double [ 1.000000e+00, %._crit_edge39.us ], [ %143, %.lr.ph42.us ]
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %indvars.iv87, i64 %indvars.iv85
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, %130
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv87, i64 %indvars.iv85
  %135 = load double, double* %134, align 8
  %136 = fadd double %133, %135
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv87, i64 %indvars.iv85
  store double %136, double* %137, align 8
  %indvars.iv.next86 = add nsw i64 %indvars.iv85, -1
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %indvars.iv87, i64 %indvars.iv.next86
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %136
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv87, i64 %indvars.iv.next86
  %142 = load double, double* %141, align 8
  %143 = fadd double %140, %142
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv87, i64 %indvars.iv.next86
  store double %143, double* %144, align 8
  %145 = icmp sgt i64 %indvars.iv.next86, 1
  %indvars.iv.next86.1 = add nsw i64 %indvars.iv85, -2
  br i1 %145, label %.lr.ph42.us, label %._crit_edge43.us

._crit_edge93:                                    ; preds = %._crit_edge93, %._crit_edge93.ph
  %store_forwarded114 = phi double [ %load_initial113, %._crit_edge93.ph ], [ %163, %._crit_edge93 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge93.ph ], [ %148, %._crit_edge93 ]
  %indvars.iv81 = phi i64 [ 1, %._crit_edge93.ph ], [ %indvars.iv.next82, %._crit_edge93 ]
  %146 = fmul double %65, %store_forwarded
  %147 = fadd double %146, %32
  %148 = fdiv double %31, %147
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %indvars.iv87, i64 %indvars.iv81
  store double %148, double* %149, align 8
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %105, i64 %indvars.iv81
  %151 = load double, double* %150, align 8
  %152 = fmul double %83, %151
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %indvars.iv87, i64 %indvars.iv81
  %154 = load double, double* %153, align 8
  %155 = fmul double %35, %154
  %156 = fsub double %155, %152
  %157 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %indvars.iv.next88, i64 %indvars.iv81
  %158 = load double, double* %157, align 8
  %159 = fmul double %36, %158
  %160 = fsub double %156, %159
  %161 = fmul double %65, %store_forwarded114
  %162 = fsub double %160, %161
  %163 = fdiv double %162, %147
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv87, i64 %indvars.iv81
  store double %163, double* %164, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next82, 999
  br i1 %exitcond84, label %._crit_edge39.us.loopexit115, label %._crit_edge93

._crit_edge39.us.loopexit:                        ; preds = %._crit_edge93.lver.orig
  br label %._crit_edge39.us

._crit_edge39.us.loopexit115:                     ; preds = %._crit_edge93
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.loopexit115, %._crit_edge39.us.loopexit
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv87, i64 999
  store double 1.000000e+00, double* %165, align 8
  br label %.lr.ph42.us

._crit_edge46:                                    ; preds = %._crit_edge43.us
  %exitcond91 = icmp eq i32 %17, 500
  %166 = add nuw nsw i32 %17, 1
  br i1 %exitcond91, label %._crit_edge, label %.preheader7

._crit_edge:                                      ; preds = %._crit_edge46
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1000 x double]*) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv6, 1000
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge10, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge10 ]
  %7 = add nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge10

; <label>:11:                                     ; preds = %._crit_edge11
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge11, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge10
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond9, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
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
