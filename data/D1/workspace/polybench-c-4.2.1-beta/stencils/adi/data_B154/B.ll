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
  %3 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @init_array([1000 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @print_array([1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
.lr.ph13:
  br label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit, %.lr.ph13
  %indvars.iv510 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next6, %.loopexit ]
  %1 = add nuw nsw i64 %indvars.iv510, 1000
  %2 = trunc i64 %1 to i32
  br label %3

; <label>:3:                                      ; preds = %3, %.lr.ph
  %indvars.iv9 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %3 ]
  %4 = trunc i64 %indvars.iv9 to i32
  %5 = sub nuw nsw i32 %2, %4
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv510, i64 %indvars.iv9
  store double %7, double* %8, align 8
  %indvars.iv.next = or i64 %indvars.iv9, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub nuw nsw i32 %2, %9
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv510, i64 %indvars.iv.next
  store double %12, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv9, 2
  %exitcond7.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond7.1, label %.loopexit, label %3

.loopexit:                                        ; preds = %3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv510, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond, label %.loopexit1, label %.lr.ph

.loopexit1:                                       ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
..preheader14_crit_edge.lr.ph:
  br label %..preheader14_crit_edge

..preheader14_crit_edge:                          ; preds = %.loopexit2, %..preheader14_crit_edge.lr.ph
  %4 = phi i32 [ 1, %..preheader14_crit_edge.lr.ph ], [ %153, %.loopexit2 ]
  br label %.lver.check

.lver.check:                                      ; preds = %..preheader14_crit_edge16, %..preheader14_crit_edge
  %indvar = phi i64 [ 0, %..preheader14_crit_edge ], [ %indvar.next, %..preheader14_crit_edge16 ]
  %indvars.iv422 = phi i64 [ 1, %..preheader14_crit_edge ], [ %14, %..preheader14_crit_edge16 ]
  %5 = add nuw nsw i64 %indvar, 1
  %6 = add nuw nsw i64 %indvar, 1
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv422
  store double 1.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv422, i64 0
  store double 0.000000e+00, double* %8, align 8
  %9 = bitcast double* %7 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv422
  %12 = bitcast [1000 x double]* %11 to i64*
  store i64 %10, i64* %12, align 8
  %13 = add nsw i64 %indvars.iv422, -1
  %14 = add nuw nsw i64 %indvars.iv422, 1
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 999
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 0
  %scevgep5 = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 999
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig, %.ph.lver.orig.preheader
  %indvars.iv18.lver.orig = phi i64 [ 1, %.ph.lver.orig.preheader ], [ %indvars.iv.next.lver.orig, %.ph.lver.orig ]
  %15 = add nsw i64 %indvars.iv18.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv422, i64 %15
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 0xC09F400000000001
  %19 = fadd double %18, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv422, i64 %indvars.iv18.lver.orig
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.lver.orig, i64 %13
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fsub double %27, %26
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.lver.orig, i64 %14
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %28, %31
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv422, i64 %15
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, 0xC09F400000000001
  %36 = fsub double %32, %35
  %37 = fdiv double %36, %19
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv422, i64 %indvars.iv18.lver.orig
  store double %37, double* %38, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv18.lver.orig, 1
  %exitcond15.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond15.lver.orig, label %.loopexit1.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep12 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep11 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %load_initial = load double, double* %scevgep11, align 8
  %load_initial13 = load double, double* %scevgep12, align 8
  br label %39

; <label>:39:                                     ; preds = %39, %.ph
  %store_forwarded14 = phi double [ %load_initial13, %.ph ], [ %57, %39 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %42, %39 ]
  %indvars.iv18 = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %39 ]
  %40 = fmul double %store_forwarded, 0xC09F400000000001
  %41 = fadd double %40, 0x40AF420000000001
  %42 = fdiv double 0x409F400000000001, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv422, i64 %indvars.iv18
  store double %42, double* %43, align 8
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %13
  %45 = bitcast double* %44 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %45, align 8
  %47 = fmul <2 x double> %46, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %50 = fsub double %49, %48
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %14
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, 0xC08F400000000001
  %54 = fsub double %50, %53
  %55 = fmul double %store_forwarded14, 0xC09F400000000001
  %56 = fsub double %54, %55
  %57 = fdiv double %56, %41
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv422, i64 %indvars.iv18
  store double %57, double* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond15, label %.loopexit1.loopexit43, label %39

.loopexit1.loopexit:                              ; preds = %.ph.lver.orig
  br label %.loopexit1

.loopexit1.loopexit43:                            ; preds = %39
  br label %.loopexit1

.loopexit1:                                       ; preds = %.loopexit1.loopexit43, %.loopexit1.loopexit
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv422
  store double 1.000000e+00, double* %59, align 8
  br label %60

..preheader14_crit_edge16:                        ; preds = %60
  %exitcond37 = icmp eq i64 %14, 999
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond37, label %.lr.ph35.preheader, label %.lver.check

.lr.ph35.preheader:                               ; preds = %..preheader14_crit_edge16
  br label %.lr.ph35

; <label>:60:                                     ; preds = %60, %.loopexit1
  %indvars.iv219 = phi i64 [ 998, %.loopexit1 ], [ %indvars.iv.next3.1, %60 ]
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv422, i64 %indvars.iv219
  %62 = load double, double* %61, align 8
  %63 = or i64 %indvars.iv219, 1
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %63, i64 %indvars.iv422
  %65 = load double, double* %64, align 8
  %66 = fmul double %62, %65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv422, i64 %indvars.iv219
  %68 = load double, double* %67, align 8
  %69 = fadd double %66, %68
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv219, i64 %indvars.iv422
  store double %69, double* %70, align 8
  %indvars.iv.next3 = add nsw i64 %indvars.iv219, -1
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv422, i64 %indvars.iv.next3
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %69
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv422, i64 %indvars.iv.next3
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next3, i64 %indvars.iv422
  store double %76, double* %77, align 8
  %indvars.iv.next3.1 = add nsw i64 %indvars.iv219, -2
  %78 = icmp sgt i64 %indvars.iv.next3, 1
  br i1 %78, label %60, label %..preheader14_crit_edge16

.lr.ph35:                                         ; preds = %..preheader_crit_edge, %.lr.ph35.preheader
  %indvar15 = phi i64 [ 0, %.lr.ph35.preheader ], [ %indvar.next16, %..preheader_crit_edge ]
  %indvars.iv1233 = phi i64 [ 1, %.lr.ph35.preheader ], [ %88, %..preheader_crit_edge ]
  %79 = add nuw nsw i64 %indvar15, 1
  %80 = add nuw nsw i64 %indvar15, 1
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1233, i64 0
  store double 1.000000e+00, double* %81, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1233, i64 0
  store double 0.000000e+00, double* %82, align 8
  %83 = bitcast double* %81 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1233
  %86 = bitcast [1000 x double]* %85 to i64*
  store i64 %84, i64* %86, align 8
  %87 = add nsw i64 %indvars.iv1233, -1
  %88 = add nuw nsw i64 %indvars.iv1233, 1
  %scevgep23 = getelementptr [1000 x double], [1000 x double]* %3, i64 %80, i64 999
  %scevgep21 = getelementptr [1000 x double], [1000 x double]* %3, i64 %80, i64 0
  %scevgep19 = getelementptr [1000 x double], [1000 x double]* %2, i64 %80, i64 999
  %scevgep17 = getelementptr [1000 x double], [1000 x double]* %2, i64 %80, i64 0
  %bound025 = icmp ult double* %scevgep17, %scevgep23
  %bound126 = icmp ult double* %scevgep21, %scevgep19
  %memcheck.conflict28 = and i1 %bound025, %bound126
  br i1 %memcheck.conflict28, label %.ph30.lver.orig.preheader, label %.ph30

.ph30.lver.orig.preheader:                        ; preds = %.lr.ph35
  br label %.ph30.lver.orig

.ph30.lver.orig:                                  ; preds = %.ph30.lver.orig, %.ph30.lver.orig.preheader
  %indvars.iv626.lver.orig = phi i64 [ 1, %.ph30.lver.orig.preheader ], [ %indvars.iv.next7.lver.orig, %.ph30.lver.orig ]
  %89 = add nsw i64 %indvars.iv626.lver.orig, -1
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1233, i64 %89
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, 0xC08F400000000001
  %93 = fadd double %92, 0x409F440000000001
  %94 = fdiv double 0x408F400000000001, %93
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1233, i64 %indvars.iv626.lver.orig
  store double %94, double* %95, align 8
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %87, i64 %indvars.iv626.lver.orig
  %97 = load double, double* %96, align 8
  %98 = fmul double %97, 0xC09F400000000001
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1233, i64 %indvars.iv626.lver.orig
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, 0xC0AF3E0000000001
  %102 = fsub double %101, %98
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %88, i64 %indvars.iv626.lver.orig
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, 0xC09F400000000001
  %106 = fsub double %102, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1233, i64 %89
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, 0xC08F400000000001
  %110 = fsub double %106, %109
  %111 = fdiv double %110, %93
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1233, i64 %indvars.iv626.lver.orig
  store double %111, double* %112, align 8
  %indvars.iv.next7.lver.orig = add nuw nsw i64 %indvars.iv626.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next7.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit.loopexit, label %.ph30.lver.orig

.ph30:                                            ; preds = %.lr.ph35
  %scevgep34 = getelementptr [1000 x double], [1000 x double]* %3, i64 %79, i64 0
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %2, i64 %79, i64 0
  %load_initial32 = load double, double* %scevgep31, align 8
  %load_initial35 = load double, double* %scevgep34, align 8
  br label %113

; <label>:113:                                    ; preds = %113, %.ph30
  %store_forwarded36 = phi double [ %load_initial35, %.ph30 ], [ %131, %113 ]
  %store_forwarded33 = phi double [ %load_initial32, %.ph30 ], [ %116, %113 ]
  %indvars.iv626 = phi i64 [ 1, %.ph30 ], [ %indvars.iv.next7, %113 ]
  %114 = fmul double %store_forwarded33, 0xC08F400000000001
  %115 = fadd double %114, 0x409F440000000001
  %116 = fdiv double 0x408F400000000001, %115
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1233, i64 %indvars.iv626
  store double %116, double* %117, align 8
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %87, i64 %indvars.iv626
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, 0xC09F400000000001
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1233, i64 %indvars.iv626
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, 0xC0AF3E0000000001
  %124 = fsub double %123, %120
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %88, i64 %indvars.iv626
  %126 = load double, double* %125, align 8
  %127 = fmul double %126, 0xC09F400000000001
  %128 = fsub double %124, %127
  %129 = fmul double %store_forwarded36, 0xC08F400000000001
  %130 = fsub double %128, %129
  %131 = fdiv double %130, %115
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1233, i64 %indvars.iv626
  store double %131, double* %132, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv626, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 999
  br i1 %exitcond, label %.loopexit.loopexit42, label %113

.loopexit.loopexit:                               ; preds = %.ph30.lver.orig
  br label %.loopexit

.loopexit.loopexit42:                             ; preds = %113
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit42, %.loopexit.loopexit
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1233, i64 999
  store double 1.000000e+00, double* %133, align 8
  br label %134

..preheader_crit_edge:                            ; preds = %134
  %exitcond38 = icmp eq i64 %88, 999
  %indvar.next16 = add nuw nsw i64 %indvar15, 1
  br i1 %exitcond38, label %.loopexit2, label %.lr.ph35

; <label>:134:                                    ; preds = %134, %.loopexit
  %indvars.iv1030 = phi i64 [ 998, %.loopexit ], [ %indvars.iv.next11.1, %134 ]
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1233, i64 %indvars.iv1030
  %136 = load double, double* %135, align 8
  %137 = or i64 %indvars.iv1030, 1
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1233, i64 %137
  %139 = load double, double* %138, align 8
  %140 = fmul double %136, %139
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1233, i64 %indvars.iv1030
  %142 = load double, double* %141, align 8
  %143 = fadd double %140, %142
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1233, i64 %indvars.iv1030
  store double %143, double* %144, align 8
  %indvars.iv.next11 = add nsw i64 %indvars.iv1030, -1
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1233, i64 %indvars.iv.next11
  %146 = load double, double* %145, align 8
  %147 = fmul double %146, %143
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1233, i64 %indvars.iv.next11
  %149 = load double, double* %148, align 8
  %150 = fadd double %147, %149
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1233, i64 %indvars.iv.next11
  store double %150, double* %151, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv1030, -2
  %152 = icmp sgt i64 %indvars.iv.next11, 1
  br i1 %152, label %134, label %..preheader_crit_edge

.loopexit2:                                       ; preds = %..preheader_crit_edge
  %153 = add nuw nsw i32 %4, 1
  %exitcond39 = icmp eq i32 %153, 501
  br i1 %exitcond39, label %.loopexit3, label %..preheader14_crit_edge

.loopexit3:                                       ; preds = %.loopexit2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph15:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit, %.lr.ph15
  %indvars.iv512 = phi i64 [ 0, %.lr.ph15 ], [ %indvars.iv.next6, %.loopexit ]
  %5 = mul nuw nsw i64 %indvars.iv512, 1000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv9 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %5, %indvars.iv9
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv512, i64 %indvars.iv9
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond7, label %.loopexit, label %6

.loopexit:                                        ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv512, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond, label %.loopexit1, label %.lr.ph

.loopexit1:                                       ; preds = %.loopexit
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
