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
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call void @print_array(i32 1000, [1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [1000 x double]*) #2 {
.preheader.lr.ph..preheader.us_crit_edge:
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv12 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next13, %.loopexit.us ]
  %2 = trunc i64 %indvars.iv12 to i32
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %3 ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 1000, %4
  %6 = add nuw nsw i32 %5, %2
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub nuw nsw i32 1000, %9
  %11 = add nuw nsw i32 %10, %2
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.000000e+03, double 1.000000e+03>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.us, label %3

.loopexit.us:                                     ; preds = %3
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond14, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) #2 {
.preheader7.lr.ph:
  br label %.preheader7

.preheader7:                                      ; preds = %.loopexit32, %.preheader7.lr.ph
  %6 = phi i32 [ 1, %.preheader7.lr.ph ], [ %151, %.loopexit32 ]
  br label %._crit_edge56.lver.check

._crit_edge56.lver.check:                         ; preds = %.loopexit30.us, %.preheader7
  %indvar = phi i64 [ 0, %.preheader7 ], [ %indvar.next, %.loopexit30.us ]
  %indvars.iv72 = phi i64 [ 1, %.preheader7 ], [ %16, %.loopexit30.us ]
  %7 = add i64 %indvar, 1
  %8 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 0
  %scevgep90 = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 999
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 999
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv72
  store double 1.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv72, i64 0
  store double 0.000000e+00, double* %10, align 8
  %11 = bitcast double* %9 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72
  %14 = bitcast [1000 x double]* %13 to i64*
  store i64 %12, i64* %14, align 8
  %15 = add nsw i64 %indvars.iv72, -1
  %16 = add nuw nsw i64 %indvars.iv72, 1
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %scevgep92, %scevgep90
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge56.lver.orig.preheader, label %._crit_edge56.ph

._crit_edge56.lver.orig.preheader:                ; preds = %._crit_edge56.lver.check
  br label %._crit_edge56.lver.orig

._crit_edge56.lver.orig:                          ; preds = %._crit_edge56.lver.orig.preheader, %._crit_edge56.lver.orig
  %indvars.iv68.lver.orig = phi i64 [ %indvars.iv.next69.lver.orig, %._crit_edge56.lver.orig ], [ 1, %._crit_edge56.lver.orig.preheader ]
  %17 = add nsw i64 %indvars.iv68.lver.orig, -1
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv72, i64 %17
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, 0xC09F400000000001
  %21 = fadd double %20, 0x40AF420000000001
  %22 = fdiv double 0x409F400000000001, %21
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv68.lver.orig
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv68.lver.orig, i64 %15
  %25 = bitcast double* %24 to <2 x double>*
  %26 = load <2 x double>, <2 x double>* %25, align 8
  %27 = fmul <2 x double> %26, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fsub double %29, %28
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv68.lver.orig, i64 %16
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 0xC08F400000000001
  %34 = fsub double %30, %33
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %17
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, 0xC09F400000000001
  %38 = fsub double %34, %37
  %39 = fdiv double %38, %21
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv68.lver.orig
  store double %39, double* %40, align 8
  %indvars.iv.next69.lver.orig = add nuw nsw i64 %indvars.iv68.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next69.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit31.us.loopexit, label %._crit_edge56.lver.orig

._crit_edge56.ph:                                 ; preds = %._crit_edge56.lver.check
  %scevgep97 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep96 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %load_initial = load double, double* %scevgep96, align 8
  %load_initial98 = load double, double* %scevgep97, align 8
  br label %._crit_edge56

._crit_edge56:                                    ; preds = %._crit_edge56, %._crit_edge56.ph
  %store_forwarded99 = phi double [ %load_initial98, %._crit_edge56.ph ], [ %58, %._crit_edge56 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge56.ph ], [ %43, %._crit_edge56 ]
  %indvars.iv68 = phi i64 [ 1, %._crit_edge56.ph ], [ %indvars.iv.next69, %._crit_edge56 ]
  %41 = fmul double %store_forwarded, 0xC09F400000000001
  %42 = fadd double %41, 0x40AF420000000001
  %43 = fdiv double 0x409F400000000001, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv68
  store double %43, double* %44, align 8
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv68, i64 %15
  %46 = bitcast double* %45 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %46, align 8
  %48 = fmul <2 x double> %47, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %49 = extractelement <2 x double> %48, i32 0
  %50 = extractelement <2 x double> %48, i32 1
  %51 = fsub double %50, %49
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv68, i64 %16
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, 0xC08F400000000001
  %55 = fsub double %51, %54
  %56 = fmul double %store_forwarded99, 0xC09F400000000001
  %57 = fsub double %55, %56
  %58 = fdiv double %57, %42
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv68
  store double %58, double* %59, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond = icmp eq i64 %indvars.iv.next69, 999
  br i1 %exitcond, label %.loopexit31.us.loopexit121, label %._crit_edge56

.lr.ph12.us:                                      ; preds = %.lr.ph12.us, %.loopexit31.us
  %indvars.iv70 = phi i64 [ 998, %.loopexit31.us ], [ %indvars.iv.next71.1, %.lr.ph12.us ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv70
  %61 = load double, double* %60, align 8
  %62 = or i64 %indvars.iv70, 1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %62, i64 %indvars.iv72
  %64 = load double, double* %63, align 8
  %65 = fmul double %61, %64
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv70
  %67 = load double, double* %66, align 8
  %68 = fadd double %65, %67
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv70, i64 %indvars.iv72
  store double %68, double* %69, align 8
  %indvars.iv.next71 = add nsw i64 %indvars.iv70, -1
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv.next71
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %68
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv.next71
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next71, i64 %indvars.iv72
  store double %75, double* %76, align 8
  %77 = icmp sgt i64 %indvars.iv.next71, 1
  %indvars.iv.next71.1 = add nsw i64 %indvars.iv70, -2
  br i1 %77, label %.lr.ph12.us, label %.loopexit30.us

.loopexit30.us:                                   ; preds = %.lr.ph12.us
  %exitcond85 = icmp eq i64 %16, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond85, label %._crit_edge58.lver.check.preheader, label %._crit_edge56.lver.check

._crit_edge58.lver.check.preheader:               ; preds = %.loopexit30.us
  br label %._crit_edge58.lver.check

.loopexit31.us.loopexit:                          ; preds = %._crit_edge56.lver.orig
  br label %.loopexit31.us

.loopexit31.us.loopexit121:                       ; preds = %._crit_edge56
  br label %.loopexit31.us

.loopexit31.us:                                   ; preds = %.loopexit31.us.loopexit121, %.loopexit31.us.loopexit
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv72
  store double 1.000000e+00, double* %78, align 8
  br label %.lr.ph12.us

._crit_edge58.lver.check:                         ; preds = %._crit_edge58.lver.check.preheader, %.loopexit.us
  %indvar100 = phi i64 [ %indvar.next101, %.loopexit.us ], [ 0, %._crit_edge58.lver.check.preheader ]
  %indvars.iv82 = phi i64 [ %88, %.loopexit.us ], [ 1, %._crit_edge58.lver.check.preheader ]
  %79 = add i64 %indvar100, 1
  %80 = add i64 %indvar100, 1
  %scevgep102 = getelementptr [1000 x double], [1000 x double]* %4, i64 %80, i64 0
  %scevgep104 = getelementptr [1000 x double], [1000 x double]* %4, i64 %80, i64 999
  %scevgep106 = getelementptr [1000 x double], [1000 x double]* %5, i64 %80, i64 0
  %scevgep108 = getelementptr [1000 x double], [1000 x double]* %5, i64 %80, i64 999
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv82, i64 0
  store double 1.000000e+00, double* %81, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv82, i64 0
  store double 0.000000e+00, double* %82, align 8
  %83 = bitcast double* %81 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82
  %86 = bitcast [1000 x double]* %85 to i64*
  store i64 %84, i64* %86, align 8
  %87 = add nsw i64 %indvars.iv82, -1
  %88 = add nuw nsw i64 %indvars.iv82, 1
  %bound0110 = icmp ult double* %scevgep102, %scevgep108
  %bound1111 = icmp ult double* %scevgep106, %scevgep104
  %memcheck.conflict113 = and i1 %bound0110, %bound1111
  br i1 %memcheck.conflict113, label %._crit_edge58.lver.orig.preheader, label %._crit_edge58.ph

._crit_edge58.lver.orig.preheader:                ; preds = %._crit_edge58.lver.check
  br label %._crit_edge58.lver.orig

._crit_edge58.lver.orig:                          ; preds = %._crit_edge58.lver.orig.preheader, %._crit_edge58.lver.orig
  %indvars.iv78.lver.orig = phi i64 [ %indvars.iv.next79.lver.orig, %._crit_edge58.lver.orig ], [ 1, %._crit_edge58.lver.orig.preheader ]
  %89 = add nsw i64 %indvars.iv78.lver.orig, -1
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv82, i64 %89
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, 0xC08F400000000001
  %93 = fadd double %92, 0x409F440000000001
  %94 = fdiv double 0x408F400000000001, %93
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78.lver.orig
  store double %94, double* %95, align 8
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv78.lver.orig
  %97 = load double, double* %96, align 8
  %98 = fmul double %97, 0xC09F400000000001
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv82, i64 %indvars.iv78.lver.orig
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, 0xC0AF3E0000000001
  %102 = fsub double %101, %98
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %88, i64 %indvars.iv78.lver.orig
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, 0xC09F400000000001
  %106 = fsub double %102, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %89
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, 0xC08F400000000001
  %110 = fsub double %106, %109
  %111 = fdiv double %110, %93
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv78.lver.orig
  store double %111, double* %112, align 8
  %indvars.iv.next79.lver.orig = add nuw nsw i64 %indvars.iv78.lver.orig, 1
  %exitcond86.lver.orig = icmp eq i64 %indvars.iv.next79.lver.orig, 999
  br i1 %exitcond86.lver.orig, label %.loopexit29.us.loopexit, label %._crit_edge58.lver.orig

._crit_edge58.ph:                                 ; preds = %._crit_edge58.lver.check
  %scevgep117 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 0
  %scevgep114 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 0
  %load_initial115 = load double, double* %scevgep114, align 8
  %load_initial118 = load double, double* %scevgep117, align 8
  br label %._crit_edge58

._crit_edge58:                                    ; preds = %._crit_edge58, %._crit_edge58.ph
  %store_forwarded119 = phi double [ %load_initial118, %._crit_edge58.ph ], [ %130, %._crit_edge58 ]
  %store_forwarded116 = phi double [ %load_initial115, %._crit_edge58.ph ], [ %115, %._crit_edge58 ]
  %indvars.iv78 = phi i64 [ 1, %._crit_edge58.ph ], [ %indvars.iv.next79, %._crit_edge58 ]
  %113 = fmul double %store_forwarded116, 0xC08F400000000001
  %114 = fadd double %113, 0x409F440000000001
  %115 = fdiv double 0x408F400000000001, %114
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78
  store double %115, double* %116, align 8
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv78
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, 0xC09F400000000001
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv82, i64 %indvars.iv78
  %121 = load double, double* %120, align 8
  %122 = fmul double %121, 0xC0AF3E0000000001
  %123 = fsub double %122, %119
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %88, i64 %indvars.iv78
  %125 = load double, double* %124, align 8
  %126 = fmul double %125, 0xC09F400000000001
  %127 = fsub double %123, %126
  %128 = fmul double %store_forwarded119, 0xC08F400000000001
  %129 = fsub double %127, %128
  %130 = fdiv double %129, %114
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv78
  store double %130, double* %131, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next79, 999
  br i1 %exitcond86, label %.loopexit29.us.loopexit120, label %._crit_edge58

.lr.ph23.us:                                      ; preds = %.lr.ph23.us, %.loopexit29.us
  %indvars.iv80 = phi i64 [ 998, %.loopexit29.us ], [ %indvars.iv.next81.1, %.lr.ph23.us ]
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv80
  %133 = load double, double* %132, align 8
  %134 = or i64 %indvars.iv80, 1
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv82, i64 %134
  %136 = load double, double* %135, align 8
  %137 = fmul double %133, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv80
  %139 = load double, double* %138, align 8
  %140 = fadd double %137, %139
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv82, i64 %indvars.iv80
  store double %140, double* %141, align 8
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, -1
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next81
  %143 = load double, double* %142, align 8
  %144 = fmul double %143, %140
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv.next81
  %146 = load double, double* %145, align 8
  %147 = fadd double %144, %146
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv82, i64 %indvars.iv.next81
  store double %147, double* %148, align 8
  %149 = icmp sgt i64 %indvars.iv.next81, 1
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, -2
  br i1 %149, label %.lr.ph23.us, label %.loopexit.us

.loopexit.us:                                     ; preds = %.lr.ph23.us
  %exitcond87 = icmp eq i64 %88, 999
  %indvar.next101 = add i64 %indvar100, 1
  br i1 %exitcond87, label %.loopexit32, label %._crit_edge58.lver.check

.loopexit29.us.loopexit:                          ; preds = %._crit_edge58.lver.orig
  br label %.loopexit29.us

.loopexit29.us.loopexit120:                       ; preds = %._crit_edge58
  br label %.loopexit29.us

.loopexit29.us:                                   ; preds = %.loopexit29.us.loopexit120, %.loopexit29.us.loopexit
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv82, i64 999
  store double 1.000000e+00, double* %150, align 8
  br label %.lr.ph23.us

.loopexit32:                                      ; preds = %.loopexit.us
  %151 = add nuw nsw i32 %6, 1
  %exitcond88 = icmp eq i32 %151, 501
  br i1 %exitcond88, label %._crit_edge, label %.preheader7

._crit_edge:                                      ; preds = %.loopexit32
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1000 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %6 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %._crit_edge12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
