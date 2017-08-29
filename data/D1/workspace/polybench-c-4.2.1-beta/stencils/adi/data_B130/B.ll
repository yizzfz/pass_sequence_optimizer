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
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %..preheader_crit_edge ]
  br label %2

; <label>:2:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader ]
  %3 = sub nuw nsw i64 1000, %indvars.iv
  %4 = add nuw nsw i64 %3, %indvars.iv1
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  store double %7, double* %8, align 8
  %exitcond = icmp eq i64 %indvars.iv, 999
  br i1 %exitcond, label %9, label %._crit_edge

._crit_edge:                                      ; preds = %2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %2

; <label>:9:                                      ; preds = %2
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %10, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %9
  br label %.preheader

; <label>:10:                                     ; preds = %9
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %5 = alloca [1000 x double]*, align 8
  %6 = alloca [1000 x double]*, align 8
  %7 = alloca [1000 x double]*, align 8
  %8 = alloca [1000 x double]*, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  store [1000 x double]* %0, [1000 x double]** %5, align 8
  store [1000 x double]* %1, [1000 x double]** %6, align 8
  store [1000 x double]* %2, [1000 x double]** %7, align 8
  store [1000 x double]* %3, [1000 x double]** %8, align 8
  store double 0xC09F400000000001, double* %9, align 8
  store double 0xC09F400000000001, double* %11, align 8
  store double 0xC08F400000000001, double* %12, align 8
  store double 0x40AF420000000001, double* %10, align 8
  store double 0x409F440000000001, double* %13, align 8
  store double 0xC08F400000000001, double* %14, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge33..preheader7_crit_edge, %4
  %15 = phi [1000 x double]* [ %1, %4 ], [ %154, %._crit_edge33..preheader7_crit_edge ]
  %16 = phi i32 [ 1, %4 ], [ %159, %._crit_edge33..preheader7_crit_edge ]
  %17 = phi [1000 x double]* [ %2, %4 ], [ %131, %._crit_edge33..preheader7_crit_edge ]
  br label %.lr.ph

.lver.check:                                      ; preds = %..lver.check_crit_edge, %..lr.ph32.split.us_crit_edge18
  %indvar = phi i64 [ %18, %..lver.check_crit_edge ], [ 0, %..lr.ph32.split.us_crit_edge18 ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %..lver.check_crit_edge ], [ 1, %..lr.ph32.split.us_crit_edge18 ]
  %18 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %131, i64 %18, i64 0
  %scevgep42 = getelementptr [1000 x double], [1000 x double]* %131, i64 %18, i64 999
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %126, i64 %18, i64 0
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %126, i64 %18, i64 999
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %indvars.iv16, i64 0
  store double 1.000000e+00, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %131, i64 %indvars.iv16, i64 0
  store double 0.000000e+00, double* %20, align 8
  %21 = bitcast double* %19 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %126, i64 %indvars.iv16
  %24 = bitcast [1000 x double]* %23 to i64*
  store i64 %22, i64* %24, align 8
  %25 = add nsw i64 %indvars.iv16, -1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig..ph.lver.orig_crit_edge, %.ph.lver.orig.preheader
  %indvars.iv11.lver.orig = phi i64 [ %indvars.iv.next12.lver.orig, %.ph.lver.orig..ph.lver.orig_crit_edge ], [ 1, %.ph.lver.orig.preheader ]
  %26 = add nsw i64 %indvars.iv11.lver.orig, -1
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %131, i64 %indvars.iv16, i64 %26
  %28 = load double, double* %27, align 8
  %29 = fmul double %107, %28
  %30 = fadd double %29, %153
  %31 = fdiv double %152, %30
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %131, i64 %indvars.iv16, i64 %indvars.iv11.lver.orig
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %154, i64 %25, i64 %indvars.iv11.lver.orig
  %34 = load double, double* %33, align 8
  %35 = fmul double %125, %34
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %154, i64 %indvars.iv16, i64 %indvars.iv11.lver.orig
  %37 = load double, double* %36, align 8
  %38 = fmul double %156, %37
  %39 = fsub double %38, %35
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %154, i64 %indvars.iv.next17, i64 %indvars.iv11.lver.orig
  %41 = load double, double* %40, align 8
  %42 = fmul double %157, %41
  %43 = fsub double %39, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %126, i64 %indvars.iv16, i64 %26
  %45 = load double, double* %44, align 8
  %46 = fmul double %107, %45
  %47 = fsub double %43, %46
  %48 = fdiv double %47, %30
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %126, i64 %indvars.iv16, i64 %indvars.iv11.lver.orig
  store double %48, double* %49, align 8
  %exitcond13.lver.orig = icmp eq i64 %indvars.iv11.lver.orig, 998
  br i1 %exitcond13.lver.orig, label %._crit_edge31.us.loopexit, label %.ph.lver.orig..ph.lver.orig_crit_edge

.ph.lver.orig..ph.lver.orig_crit_edge:            ; preds = %.ph.lver.orig
  %indvars.iv.next12.lver.orig = add nuw nsw i64 %indvars.iv11.lver.orig, 1
  br label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial50 = load double, double* %scevgep44, align 8
  br label %61

; <label>:50:                                     ; preds = %51
  %exitcond30 = icmp eq i64 %indvars.iv.next17, 999
  br i1 %exitcond30, label %._crit_edge33, label %..lver.check_crit_edge

..lver.check_crit_edge:                           ; preds = %50
  br label %.lver.check

; <label>:51:                                     ; preds = %._crit_edge58, %._crit_edge31.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge58 ], [ 998, %._crit_edge31.us ]
  %52 = phi double [ %58, %._crit_edge58 ], [ 1.000000e+00, %._crit_edge31.us ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %131, i64 %indvars.iv16, i64 %indvars.iv14
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %52
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %126, i64 %indvars.iv16, i64 %indvars.iv14
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %indvars.iv16, i64 %indvars.iv14
  store double %58, double* %59, align 8
  %60 = icmp sgt i64 %indvars.iv14, 1
  br i1 %60, label %._crit_edge58, label %50

._crit_edge58:                                    ; preds = %51
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, -1
  br label %51

; <label>:61:                                     ; preds = %._crit_edge59, %.ph
  %store_forwarded51 = phi double [ %load_initial50, %.ph ], [ %79, %._crit_edge59 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %64, %._crit_edge59 ]
  %indvars.iv11 = phi i64 [ 1, %.ph ], [ %indvars.iv.next12, %._crit_edge59 ]
  %62 = fmul double %107, %store_forwarded
  %63 = fadd double %62, %153
  %64 = fdiv double %152, %63
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %131, i64 %indvars.iv16, i64 %indvars.iv11
  store double %64, double* %65, align 8
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %154, i64 %25, i64 %indvars.iv11
  %67 = load double, double* %66, align 8
  %68 = fmul double %125, %67
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %154, i64 %indvars.iv16, i64 %indvars.iv11
  %70 = load double, double* %69, align 8
  %71 = fmul double %156, %70
  %72 = fsub double %71, %68
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %154, i64 %indvars.iv.next17, i64 %indvars.iv11
  %74 = load double, double* %73, align 8
  %75 = fmul double %157, %74
  %76 = fsub double %72, %75
  %77 = fmul double %107, %store_forwarded51
  %78 = fsub double %76, %77
  %79 = fdiv double %78, %63
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %126, i64 %indvars.iv16, i64 %indvars.iv11
  store double %79, double* %80, align 8
  %exitcond13 = icmp eq i64 %indvars.iv11, 998
  br i1 %exitcond13, label %._crit_edge31.us.loopexit52, label %._crit_edge59

._crit_edge59:                                    ; preds = %61
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br label %61

._crit_edge31.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge31.us

._crit_edge31.us.loopexit52:                      ; preds = %61
  br label %._crit_edge31.us

._crit_edge31.us:                                 ; preds = %._crit_edge31.us.loopexit52, %._crit_edge31.us.loopexit
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %indvars.iv16, i64 999
  store double 1.000000e+00, double* %81, align 8
  br label %51

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %.preheader7
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %..lr.ph_crit_edge ], [ 1, %.preheader7 ]
  %82 = phi [1000 x double]* [ %.pre, %..lr.ph_crit_edge ], [ %15, %.preheader7 ]
  %83 = phi [1000 x double]* [ %131, %..lr.ph_crit_edge ], [ %17, %.preheader7 ]
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 0, i64 %indvars.iv9
  store double 1.000000e+00, double* %84, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv9, i64 0
  store double 0.000000e+00, double* %85, align 8
  %86 = load [1000 x double]*, [1000 x double]** %6, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %86, i64 0, i64 %indvars.iv9
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = load [1000 x double]*, [1000 x double]** %8, align 8
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %90, i64 %indvars.iv9
  %92 = bitcast [1000 x double]* %91 to i64*
  store i64 %89, i64* %92, align 8
  %93 = add nsw i64 %indvars.iv9, -1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %.pre42 = load double, double* %9, align 8
  %.pre43 = load double, double* %10, align 8
  br label %94

; <label>:94:                                     ; preds = %._crit_edge60, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge60 ], [ 1, %.lr.ph ]
  %95 = phi double [ %135, %._crit_edge60 ], [ %.pre43, %.lr.ph ]
  %96 = phi double [ %125, %._crit_edge60 ], [ %.pre42, %.lr.ph ]
  %97 = phi [1000 x double]* [ %131, %._crit_edge60 ], [ %83, %.lr.ph ]
  %98 = load double, double* %11, align 8
  %99 = fsub double -0.000000e+00, %98
  %100 = add nsw i64 %indvars.iv, -1
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv9, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fmul double %96, %102
  %104 = fadd double %103, %95
  %105 = fdiv double %99, %104
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv9, i64 %indvars.iv
  store double %105, double* %106, align 8
  %107 = load double, double* %12, align 8
  %108 = load [1000 x double]*, [1000 x double]** %5, align 8
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %indvars.iv, i64 %93
  %110 = bitcast double* %109 to <2 x double>*
  %111 = fmul double %107, 2.000000e+00
  %112 = fadd double %111, 1.000000e+00
  %113 = load <2 x double>, <2 x double>* %110, align 8
  %114 = insertelement <2 x double> undef, double %107, i32 0
  %115 = insertelement <2 x double> %114, double %112, i32 1
  %116 = fmul <2 x double> %115, %113
  %117 = extractelement <2 x double> %116, i32 0
  %118 = extractelement <2 x double> %116, i32 1
  %119 = fsub double %118, %117
  %120 = load double, double* %14, align 8
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %indvars.iv, i64 %indvars.iv.next10
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = fsub double %119, %123
  %125 = load double, double* %9, align 8
  %126 = load [1000 x double]*, [1000 x double]** %8, align 8
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %126, i64 %indvars.iv9, i64 %100
  %128 = load double, double* %127, align 8
  %129 = fmul double %125, %128
  %130 = fsub double %124, %129
  %131 = load [1000 x double]*, [1000 x double]** %7, align 8
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %131, i64 %indvars.iv9, i64 %100
  %133 = load double, double* %132, align 8
  %134 = fmul double %125, %133
  %135 = load double, double* %10, align 8
  %136 = fadd double %134, %135
  %137 = fdiv double %130, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %126, i64 %indvars.iv9, i64 %indvars.iv
  store double %137, double* %138, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  br i1 %exitcond, label %._crit_edge, label %._crit_edge60

._crit_edge60:                                    ; preds = %94
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %94

._crit_edge:                                      ; preds = %94
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %86, i64 999, i64 %indvars.iv9
  store double 1.000000e+00, double* %139, align 8
  br label %140

; <label>:140:                                    ; preds = %._crit_edge61, %._crit_edge
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge61 ], [ 998, %._crit_edge ]
  %141 = phi double [ %147, %._crit_edge61 ], [ 1.000000e+00, %._crit_edge ]
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %131, i64 %indvars.iv9, i64 %indvars.iv7
  %143 = load double, double* %142, align 8
  %144 = fmul double %143, %141
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %126, i64 %indvars.iv9, i64 %indvars.iv7
  %146 = load double, double* %145, align 8
  %147 = fadd double %144, %146
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %86, i64 %indvars.iv7, i64 %indvars.iv9
  store double %147, double* %148, align 8
  %149 = icmp sgt i64 %indvars.iv7, 1
  br i1 %149, label %._crit_edge61, label %150

._crit_edge61:                                    ; preds = %140
  %indvars.iv.next8 = add nsw i64 %indvars.iv7, -1
  br label %140

; <label>:150:                                    ; preds = %140
  %151 = icmp slt i64 %indvars.iv.next10, 999
  br i1 %151, label %..lr.ph_crit_edge, label %..lr.ph32.split.us_crit_edge18

..lr.ph32.split.us_crit_edge18:                   ; preds = %150
  %152 = fsub double -0.000000e+00, %120
  %153 = load double, double* %13, align 8
  %154 = load [1000 x double]*, [1000 x double]** %6, align 8
  %155 = fmul double %125, 2.000000e+00
  %156 = fadd double %155, 1.000000e+00
  %157 = load double, double* %11, align 8
  br label %.lver.check

..lr.ph_crit_edge:                                ; preds = %150
  %.pre = load [1000 x double]*, [1000 x double]** %6, align 8
  br label %.lr.ph

._crit_edge33:                                    ; preds = %50
  %158 = icmp sgt i32 %16, 499
  br i1 %158, label %160, label %._crit_edge33..preheader7_crit_edge

._crit_edge33..preheader7_crit_edge:              ; preds = %._crit_edge33
  %159 = add nuw nsw i32 %16, 1
  br label %.preheader7

; <label>:160:                                    ; preds = %._crit_edge33
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %..preheader_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge.._crit_edge3_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge.._crit_edge3_crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge3.._crit_edge_crit_edge

._crit_edge3.._crit_edge_crit_edge:               ; preds = %._crit_edge3
  br label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge3
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3.._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge.._crit_edge3_crit_edge

._crit_edge.._crit_edge3_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge3

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %17
  br label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
