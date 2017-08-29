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
  store double 0x40AF420000000001, double* %11, align 8
  store double 0xC09F400000000001, double* %10, align 8
  store double 0xC09F400000000001, double* %12, align 8
  store double 0xC08F400000000001, double* %13, align 8
  store double 0x409F440000000001, double* %14, align 8
  store double 0xC08F400000000001, double* %15, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge46, %.preheader7.lr.ph
  %16 = phi i32 [ 1, %.preheader7.lr.ph ], [ %174, %._crit_edge46 ]
  %17 = phi [1000 x double]* [ %4, %.preheader7.lr.ph ], [ %95, %._crit_edge46 ]
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %.preheader7, %._crit_edge27.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge27.us ], [ 1, %.preheader7 ]
  %18 = phi [1000 x double]* [ %82, %._crit_edge27.us ], [ %17, %.preheader7 ]
  %19 = load [1000 x double]*, [1000 x double]** %7, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv77
  store double 1.000000e+00, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv77, i64 0
  store double 0.000000e+00, double* %21, align 8
  %22 = load [1000 x double]*, [1000 x double]** %7, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 0, i64 %indvars.iv77
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = load [1000 x double]*, [1000 x double]** %9, align 8
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv77
  %28 = bitcast [1000 x double]* %27 to i64*
  store i64 %25, i64* %28, align 8
  %29 = add nsw i64 %indvars.iv77, -1
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %.pre = load double, double* %10, align 8
  %.pre61 = load double, double* %11, align 8
  br label %._crit_edge92

._crit_edge27.us:                                 ; preds = %.lr.ph26.us
  %exitcond80 = icmp eq i64 %indvars.iv.next78, 999
  br i1 %exitcond80, label %._crit_edge93.lver.check.preheader, label %.lr.ph29.split.us

._crit_edge93.lver.check.preheader:               ; preds = %._crit_edge27.us
  br label %._crit_edge93.lver.check

.lr.ph26.us:                                      ; preds = %.lr.ph26.us, %._crit_edge.us
  %indvars.iv75 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next76.1, %.lr.ph26.us ]
  %30 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %43, %.lr.ph26.us ]
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv77, i64 %indvars.iv75
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %30
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv77, i64 %indvars.iv75
  %35 = load double, double* %34, align 8
  %36 = fadd double %33, %35
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv75, i64 %indvars.iv77
  store double %36, double* %37, align 8
  %indvars.iv.next76 = add nsw i64 %indvars.iv75, -1
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv77, i64 %indvars.iv.next76
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %36
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv77, i64 %indvars.iv.next76
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv.next76, i64 %indvars.iv77
  store double %43, double* %44, align 8
  %45 = icmp sgt i64 %indvars.iv.next76, 1
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, -2
  br i1 %45, label %.lr.ph26.us, label %._crit_edge27.us

._crit_edge92:                                    ; preds = %._crit_edge92, %.lr.ph29.split.us
  %indvars.iv71 = phi i64 [ 1, %.lr.ph29.split.us ], [ %indvars.iv.next72, %._crit_edge92 ]
  %46 = phi double [ %.pre61, %.lr.ph29.split.us ], [ %86, %._crit_edge92 ]
  %47 = phi double [ %.pre, %.lr.ph29.split.us ], [ %76, %._crit_edge92 ]
  %48 = phi [1000 x double]* [ %18, %.lr.ph29.split.us ], [ %82, %._crit_edge92 ]
  %49 = load double, double* %12, align 8
  %50 = fsub double -0.000000e+00, %49
  %51 = add nsw i64 %indvars.iv71, -1
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv77, i64 %51
  %53 = load double, double* %52, align 8
  %54 = fmul double %47, %53
  %55 = fadd double %54, %46
  %56 = fdiv double %50, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv77, i64 %indvars.iv71
  store double %56, double* %57, align 8
  %58 = load double, double* %13, align 8
  %59 = load [1000 x double]*, [1000 x double]** %6, align 8
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv71, i64 %29
  %61 = bitcast double* %60 to <2 x double>*
  %62 = fmul double %58, 2.000000e+00
  %63 = fadd double %62, 1.000000e+00
  %64 = load <2 x double>, <2 x double>* %61, align 8
  %65 = insertelement <2 x double> undef, double %58, i32 0
  %66 = insertelement <2 x double> %65, double %63, i32 1
  %67 = fmul <2 x double> %66, %64
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %70 = fsub double %69, %68
  %71 = load double, double* %15, align 8
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv71, i64 %indvars.iv.next78
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %70, %74
  %76 = load double, double* %10, align 8
  %77 = load [1000 x double]*, [1000 x double]** %9, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv77, i64 %51
  %79 = load double, double* %78, align 8
  %80 = fmul double %76, %79
  %81 = fsub double %75, %80
  %82 = load [1000 x double]*, [1000 x double]** %8, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv77, i64 %51
  %84 = load double, double* %83, align 8
  %85 = fmul double %76, %84
  %86 = load double, double* %11, align 8
  %87 = fadd double %85, %86
  %88 = fdiv double %81, %87
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv77, i64 %indvars.iv71
  store double %88, double* %89, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 999
  br i1 %exitcond74, label %._crit_edge.us, label %._crit_edge92

._crit_edge.us:                                   ; preds = %._crit_edge92
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 999, i64 %indvars.iv77
  store double 1.000000e+00, double* %90, align 8
  br label %.lr.ph26.us

._crit_edge93.lver.check:                         ; preds = %._crit_edge93.lver.check.preheader, %._crit_edge43.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge43.us ], [ 0, %._crit_edge93.lver.check.preheader ]
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge43.us ], [ 1, %._crit_edge93.lver.check.preheader ]
  %91 = phi [1000 x double]* [ %97, %._crit_edge43.us ], [ %59, %._crit_edge93.lver.check.preheader ]
  %92 = add i64 %indvar, 1
  %93 = add i64 %indvar, 1
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %91, i64 %indvars.iv87, i64 0
  store double 1.000000e+00, double* %94, align 8
  %95 = load [1000 x double]*, [1000 x double]** %8, align 8
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv87, i64 0
  store double 0.000000e+00, double* %96, align 8
  %97 = load [1000 x double]*, [1000 x double]** %6, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv87, i64 0
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = load [1000 x double]*, [1000 x double]** %9, align 8
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv87
  %103 = bitcast [1000 x double]* %102 to i64*
  store i64 %100, i64* %103, align 8
  %104 = load double, double* %15, align 8
  %105 = fsub double -0.000000e+00, %104
  %106 = load double, double* %13, align 8
  %107 = load double, double* %14, align 8
  %108 = load double, double* %10, align 8
  %109 = load [1000 x double]*, [1000 x double]** %7, align 8
  %110 = add nsw i64 %indvars.iv87, -1
  %111 = fmul double %108, 2.000000e+00
  %112 = fadd double %111, 1.000000e+00
  %113 = load double, double* %12, align 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %95, i64 %93, i64 0
  %scevgep105 = getelementptr [1000 x double], [1000 x double]* %95, i64 %93, i64 999
  %scevgep107 = getelementptr [1000 x double], [1000 x double]* %101, i64 %93, i64 0
  %scevgep109 = getelementptr [1000 x double], [1000 x double]* %101, i64 %93, i64 999
  %bound0 = icmp ult double* %scevgep, %scevgep109
  %bound1 = icmp ult double* %scevgep107, %scevgep105
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge93.lver.orig.preheader, label %._crit_edge93.ph

._crit_edge93.lver.orig.preheader:                ; preds = %._crit_edge93.lver.check
  br label %._crit_edge93.lver.orig

._crit_edge93.lver.orig:                          ; preds = %._crit_edge93.lver.orig.preheader, %._crit_edge93.lver.orig
  %indvars.iv81.lver.orig = phi i64 [ %indvars.iv.next82.lver.orig, %._crit_edge93.lver.orig ], [ 1, %._crit_edge93.lver.orig.preheader ]
  %114 = add nsw i64 %indvars.iv81.lver.orig, -1
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv87, i64 %114
  %116 = load double, double* %115, align 8
  %117 = fmul double %106, %116
  %118 = fadd double %117, %107
  %119 = fdiv double %105, %118
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv87, i64 %indvars.iv81.lver.orig
  store double %119, double* %120, align 8
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %110, i64 %indvars.iv81.lver.orig
  %122 = load double, double* %121, align 8
  %123 = fmul double %108, %122
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %indvars.iv87, i64 %indvars.iv81.lver.orig
  %125 = load double, double* %124, align 8
  %126 = fmul double %112, %125
  %127 = fsub double %126, %123
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %indvars.iv.next88, i64 %indvars.iv81.lver.orig
  %129 = load double, double* %128, align 8
  %130 = fmul double %113, %129
  %131 = fsub double %127, %130
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv87, i64 %114
  %133 = load double, double* %132, align 8
  %134 = fmul double %106, %133
  %135 = fsub double %131, %134
  %136 = fdiv double %135, %118
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv87, i64 %indvars.iv81.lver.orig
  store double %136, double* %137, align 8
  %indvars.iv.next82.lver.orig = add nuw nsw i64 %indvars.iv81.lver.orig, 1
  %exitcond84.lver.orig = icmp eq i64 %indvars.iv.next82.lver.orig, 999
  br i1 %exitcond84.lver.orig, label %._crit_edge39.us.loopexit, label %._crit_edge93.lver.orig

._crit_edge93.ph:                                 ; preds = %._crit_edge93.lver.check
  %scevgep111 = getelementptr [1000 x double], [1000 x double]* %95, i64 %92, i64 0
  %load_initial = load double, double* %scevgep111, align 8
  %scevgep112 = getelementptr [1000 x double], [1000 x double]* %101, i64 %92, i64 0
  %load_initial113 = load double, double* %scevgep112, align 8
  br label %._crit_edge93

._crit_edge43.us:                                 ; preds = %.lr.ph42.us
  %exitcond90 = icmp eq i64 %indvars.iv.next88, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond90, label %._crit_edge46, label %._crit_edge93.lver.check

.lr.ph42.us:                                      ; preds = %.lr.ph42.us, %._crit_edge39.us
  %indvars.iv85 = phi i64 [ 998, %._crit_edge39.us ], [ %indvars.iv.next86.1, %.lr.ph42.us ]
  %138 = phi double [ 1.000000e+00, %._crit_edge39.us ], [ %151, %.lr.ph42.us ]
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv87, i64 %indvars.iv85
  %140 = load double, double* %139, align 8
  %141 = fmul double %140, %138
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv87, i64 %indvars.iv85
  %143 = load double, double* %142, align 8
  %144 = fadd double %141, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv87, i64 %indvars.iv85
  store double %144, double* %145, align 8
  %indvars.iv.next86 = add nsw i64 %indvars.iv85, -1
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv87, i64 %indvars.iv.next86
  %147 = load double, double* %146, align 8
  %148 = fmul double %147, %144
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv87, i64 %indvars.iv.next86
  %150 = load double, double* %149, align 8
  %151 = fadd double %148, %150
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv87, i64 %indvars.iv.next86
  store double %151, double* %152, align 8
  %153 = icmp sgt i64 %indvars.iv.next86, 1
  %indvars.iv.next86.1 = add nsw i64 %indvars.iv85, -2
  br i1 %153, label %.lr.ph42.us, label %._crit_edge43.us

._crit_edge93:                                    ; preds = %._crit_edge93, %._crit_edge93.ph
  %store_forwarded114 = phi double [ %load_initial113, %._crit_edge93.ph ], [ %171, %._crit_edge93 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge93.ph ], [ %156, %._crit_edge93 ]
  %indvars.iv81 = phi i64 [ 1, %._crit_edge93.ph ], [ %indvars.iv.next82, %._crit_edge93 ]
  %154 = fmul double %106, %store_forwarded
  %155 = fadd double %154, %107
  %156 = fdiv double %105, %155
  %157 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv87, i64 %indvars.iv81
  store double %156, double* %157, align 8
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %110, i64 %indvars.iv81
  %159 = load double, double* %158, align 8
  %160 = fmul double %108, %159
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %indvars.iv87, i64 %indvars.iv81
  %162 = load double, double* %161, align 8
  %163 = fmul double %112, %162
  %164 = fsub double %163, %160
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %indvars.iv.next88, i64 %indvars.iv81
  %166 = load double, double* %165, align 8
  %167 = fmul double %113, %166
  %168 = fsub double %164, %167
  %169 = fmul double %106, %store_forwarded114
  %170 = fsub double %168, %169
  %171 = fdiv double %170, %155
  %172 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv87, i64 %indvars.iv81
  store double %171, double* %172, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next82, 999
  br i1 %exitcond84, label %._crit_edge39.us.loopexit115, label %._crit_edge93

._crit_edge39.us.loopexit:                        ; preds = %._crit_edge93.lver.orig
  br label %._crit_edge39.us

._crit_edge39.us.loopexit115:                     ; preds = %._crit_edge93
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.loopexit115, %._crit_edge39.us.loopexit
  %173 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv87, i64 999
  store double 1.000000e+00, double* %173, align 8
  br label %.lr.ph42.us

._crit_edge46:                                    ; preds = %._crit_edge43.us
  %exitcond91 = icmp eq i32 %16, 500
  %174 = add nuw nsw i32 %16, 1
  br i1 %exitcond91, label %._crit_edge, label %.preheader7

._crit_edge:                                      ; preds = %._crit_edge46
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
