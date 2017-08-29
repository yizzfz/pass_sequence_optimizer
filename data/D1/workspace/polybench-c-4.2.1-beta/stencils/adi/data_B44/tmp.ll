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
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv4 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next5, %._crit_edge.us ]
  %1 = add i64 %indvars.iv4, 1000
  %2 = trunc i64 %1 to i32
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %3 ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 %2, %4
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 %2, %8
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond3.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond3.1, label %._crit_edge.us, label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next5 = add nuw i64 %indvars.iv4, 1
  %15 = icmp slt i64 %indvars.iv.next5, 1000
  br i1 %15, label %.preheader.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
.preheader1.lr.ph:
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
  br label %.preheader1

.preheader1:                                      ; preds = %._crit_edge30, %.preheader1.lr.ph
  %14 = phi i32 [ 1, %.preheader1.lr.ph ], [ %177, %._crit_edge30 ]
  %15 = phi [1000 x double]* [ %2, %.preheader1.lr.ph ], [ %95, %._crit_edge30 ]
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.preheader1, %._crit_edge17.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge17.us ], [ 1, %.preheader1 ]
  %16 = phi [1000 x double]* [ %82, %._crit_edge17.us ], [ %15, %.preheader1 ]
  %17 = load [1000 x double]*, [1000 x double]** %5, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 0, i64 %indvars.iv45
  store double 1.000000e+00, double* %18, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %16, i64 %indvars.iv45, i64 0
  store double 0.000000e+00, double* %19, align 8
  %20 = load [1000 x double]*, [1000 x double]** %5, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 0, i64 %indvars.iv45
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = load [1000 x double]*, [1000 x double]** %7, align 8
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv45
  %26 = bitcast [1000 x double]* %25 to i64*
  store i64 %23, i64* %26, align 8
  %27 = add nsw i64 %indvars.iv45, -1
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %.pre = load double, double* %8, align 8
  %.pre35 = load double, double* %9, align 8
  br label %45

._crit_edge17.us:                                 ; preds = %.lr.ph16.us
  %28 = icmp slt i64 %indvars.iv.next46, 999
  br i1 %28, label %.lr.ph18.split.us, label %.lver.check.preheader

.lver.check.preheader:                            ; preds = %._crit_edge17.us
  br label %.lver.check

.lr.ph16.us:                                      ; preds = %.lr.ph16.us, %._crit_edge.us
  %indvars.iv43 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next44.1, %.lr.ph16.us ]
  %29 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %42, %.lr.ph16.us ]
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv45, i64 %indvars.iv43
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %29
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv45, i64 %indvars.iv43
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv43, i64 %indvars.iv45
  store double %35, double* %36, align 8
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, -1
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv45, i64 %indvars.iv.next44
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %35
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv45, i64 %indvars.iv.next44
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv.next44, i64 %indvars.iv45
  store double %42, double* %43, align 8
  %44 = icmp sgt i64 %indvars.iv.next44, 1
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, -2
  br i1 %44, label %.lr.ph16.us, label %._crit_edge17.us

; <label>:45:                                     ; preds = %45, %.lr.ph18.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %45 ], [ 1, %.lr.ph18.split.us ]
  %46 = phi double [ %86, %45 ], [ %.pre35, %.lr.ph18.split.us ]
  %47 = phi double [ %76, %45 ], [ %.pre, %.lr.ph18.split.us ]
  %48 = phi [1000 x double]* [ %82, %45 ], [ %16, %.lr.ph18.split.us ]
  %49 = load double, double* %10, align 8
  %50 = fsub double -0.000000e+00, %49
  %51 = add nsw i64 %indvars.iv, -1
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv45, i64 %51
  %53 = load double, double* %52, align 8
  %54 = fmul double %47, %53
  %55 = fadd double %54, %46
  %56 = fdiv double %50, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv45, i64 %indvars.iv
  store double %56, double* %57, align 8
  %58 = load double, double* %11, align 8
  %59 = load [1000 x double]*, [1000 x double]** %4, align 8
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv, i64 %27
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
  %71 = load double, double* %13, align 8
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv, i64 %indvars.iv.next46
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %70, %74
  %76 = load double, double* %8, align 8
  %77 = load [1000 x double]*, [1000 x double]** %7, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv45, i64 %51
  %79 = load double, double* %78, align 8
  %80 = fmul double %76, %79
  %81 = fsub double %75, %80
  %82 = load [1000 x double]*, [1000 x double]** %6, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv45, i64 %51
  %84 = load double, double* %83, align 8
  %85 = fmul double %76, %84
  %86 = load double, double* %9, align 8
  %87 = fadd double %85, %86
  %88 = fdiv double %81, %87
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv45, i64 %indvars.iv
  store double %88, double* %89, align 8
  %exitcond42 = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond42, label %._crit_edge.us, label %45

._crit_edge.us:                                   ; preds = %45
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 999, i64 %indvars.iv45
  store double 1.000000e+00, double* %90, align 8
  br label %.lr.ph16.us

.lver.check:                                      ; preds = %.lver.check.preheader, %._crit_edge28.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge28.us ], [ 0, %.lver.check.preheader ]
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge28.us ], [ 1, %.lver.check.preheader ]
  %91 = phi [1000 x double]* [ %97, %._crit_edge28.us ], [ %59, %.lver.check.preheader ]
  %92 = add i64 %indvar, 1
  %93 = add i64 %indvar, 1
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %91, i64 %indvars.iv53, i64 0
  store double 1.000000e+00, double* %94, align 8
  %95 = load [1000 x double]*, [1000 x double]** %6, align 8
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv53, i64 0
  store double 0.000000e+00, double* %96, align 8
  %97 = load [1000 x double]*, [1000 x double]** %4, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv53
  %99 = bitcast [1000 x double]* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = load [1000 x double]*, [1000 x double]** %7, align 8
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv53
  %103 = bitcast [1000 x double]* %102 to i64*
  store i64 %100, i64* %103, align 8
  %104 = load double, double* %13, align 8
  %105 = fsub double -0.000000e+00, %104
  %106 = load double, double* %11, align 8
  %107 = load double, double* %12, align 8
  %108 = load double, double* %8, align 8
  %109 = load [1000 x double]*, [1000 x double]** %5, align 8
  %110 = add nsw i64 %indvars.iv53, -1
  %111 = fmul double %108, 2.000000e+00
  %112 = fadd double %111, 1.000000e+00
  %113 = load double, double* %10, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %95, i64 %93, i64 0
  %scevgep5 = getelementptr [1000 x double], [1000 x double]* %95, i64 %93, i64 999
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %101, i64 %93, i64 0
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %101, i64 %93, i64 999
  %bound0 = icmp ult double* %scevgep, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv47.lver.orig = phi i64 [ %indvars.iv.next48.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %114 = add nsw i64 %indvars.iv47.lver.orig, -1
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv53, i64 %114
  %116 = load double, double* %115, align 8
  %117 = fmul double %106, %116
  %118 = fadd double %117, %107
  %119 = fdiv double %105, %118
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv53, i64 %indvars.iv47.lver.orig
  store double %119, double* %120, align 8
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %110, i64 %indvars.iv47.lver.orig
  %122 = load double, double* %121, align 8
  %123 = fmul double %108, %122
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %indvars.iv53, i64 %indvars.iv47.lver.orig
  %125 = load double, double* %124, align 8
  %126 = fmul double %112, %125
  %127 = fsub double %126, %123
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %indvars.iv.next54, i64 %indvars.iv47.lver.orig
  %129 = load double, double* %128, align 8
  %130 = fmul double %113, %129
  %131 = fsub double %127, %130
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv53, i64 %114
  %133 = load double, double* %132, align 8
  %134 = fmul double %106, %133
  %135 = fsub double %131, %134
  %136 = fdiv double %135, %118
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv53, i64 %indvars.iv47.lver.orig
  store double %136, double* %137, align 8
  %exitcond50.lver.orig = icmp eq i64 %indvars.iv47.lver.orig, 998
  %indvars.iv.next48.lver.orig = add nuw nsw i64 %indvars.iv47.lver.orig, 1
  br i1 %exitcond50.lver.orig, label %._crit_edge25.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep11 = getelementptr [1000 x double], [1000 x double]* %95, i64 %92, i64 0
  %load_initial = load double, double* %scevgep11, align 8
  %scevgep12 = getelementptr [1000 x double], [1000 x double]* %101, i64 %92, i64 0
  %load_initial13 = load double, double* %scevgep12, align 8
  br label %155

._crit_edge28.us:                                 ; preds = %.lr.ph27.us
  %138 = icmp slt i64 %indvars.iv.next54, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %138, label %.lver.check, label %._crit_edge30

.lr.ph27.us:                                      ; preds = %.lr.ph27.us, %._crit_edge25.us
  %indvars.iv51 = phi i64 [ 998, %._crit_edge25.us ], [ %indvars.iv.next52.1, %.lr.ph27.us ]
  %139 = phi double [ 1.000000e+00, %._crit_edge25.us ], [ %152, %.lr.ph27.us ]
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv53, i64 %indvars.iv51
  %141 = load double, double* %140, align 8
  %142 = fmul double %141, %139
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv53, i64 %indvars.iv51
  %144 = load double, double* %143, align 8
  %145 = fadd double %142, %144
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv53, i64 %indvars.iv51
  store double %145, double* %146, align 8
  %indvars.iv.next52 = add nsw i64 %indvars.iv51, -1
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv53, i64 %indvars.iv.next52
  %148 = load double, double* %147, align 8
  %149 = fmul double %148, %145
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv53, i64 %indvars.iv.next52
  %151 = load double, double* %150, align 8
  %152 = fadd double %149, %151
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv53, i64 %indvars.iv.next52
  store double %152, double* %153, align 8
  %154 = icmp sgt i64 %indvars.iv.next52, 1
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, -2
  br i1 %154, label %.lr.ph27.us, label %._crit_edge28.us

; <label>:155:                                    ; preds = %155, %.ph
  %store_forwarded14 = phi double [ %load_initial13, %.ph ], [ %173, %155 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %158, %155 ]
  %indvars.iv47 = phi i64 [ 1, %.ph ], [ %indvars.iv.next48, %155 ]
  %156 = fmul double %106, %store_forwarded
  %157 = fadd double %156, %107
  %158 = fdiv double %105, %157
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %95, i64 %indvars.iv53, i64 %indvars.iv47
  store double %158, double* %159, align 8
  %160 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %110, i64 %indvars.iv47
  %161 = load double, double* %160, align 8
  %162 = fmul double %108, %161
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %indvars.iv53, i64 %indvars.iv47
  %164 = load double, double* %163, align 8
  %165 = fmul double %112, %164
  %166 = fsub double %165, %162
  %167 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %indvars.iv.next54, i64 %indvars.iv47
  %168 = load double, double* %167, align 8
  %169 = fmul double %113, %168
  %170 = fsub double %166, %169
  %171 = fmul double %106, %store_forwarded14
  %172 = fsub double %170, %171
  %173 = fdiv double %172, %157
  %174 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %indvars.iv53, i64 %indvars.iv47
  store double %173, double* %174, align 8
  %exitcond50 = icmp eq i64 %indvars.iv47, 998
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  br i1 %exitcond50, label %._crit_edge25.us.loopexit15, label %155

._crit_edge25.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge25.us

._crit_edge25.us.loopexit15:                      ; preds = %155
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us.loopexit15, %._crit_edge25.us.loopexit
  %175 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv53, i64 999
  store double 1.000000e+00, double* %175, align 8
  br label %.lr.ph27.us

._crit_edge30:                                    ; preds = %._crit_edge28.us
  %176 = icmp slt i32 %14, 500
  %177 = add nuw nsw i32 %14, 1
  br i1 %176, label %.preheader1, label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge30
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv3 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next4, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv3, 1000
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %16 = icmp slt i64 %indvars.iv.next, 1000
  br i1 %16, label %._crit_edge2, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %17 = icmp slt i64 %indvars.iv.next4, 1000
  br i1 %17, label %.preheader.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
