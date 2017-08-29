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
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %15 ]
  %2 = add nuw nsw i64 %indvars.iv4, 1000
  br label %3

; <label>:3:                                      ; preds = %3, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %3 ]
  %4 = sub nuw nsw i64 %2, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %2, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %15, label %3

; <label>:15:                                     ; preds = %3
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %16 = icmp slt i64 %indvars.iv.next5, 1000
  br i1 %16, label %._crit_edge, label %17

; <label>:17:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %169, %4
  %.09 = phi i32 [ 1, %4 ], [ %170, %169 ]
  br label %.lver.check

.lver.check:                                      ; preds = %85, %._crit_edge
  %indvar = phi i64 [ %5, %85 ], [ 0, %._crit_edge ]
  %indvars.iv18 = phi i64 [ %13, %85 ], [ 1, %._crit_edge ]
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep28 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep30 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep32 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv18
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv18, -1
  %13 = add nuw nsw i64 %indvars.iv18, 1
  %bound0 = icmp ult double* %scevgep, %scevgep32
  %bound1 = icmp ult double* %scevgep30, %scevgep28
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %14 = add nsw i64 %indvars.iv.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %14
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv.lver.orig
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %13
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %14
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = fmul <2 x double> %22, <double 0x409F400000000001, double 0x409F400000000001>
  %24 = fsub <2 x double> <double 0x40AF420000000001, double 0x40AF420000000001>, %23
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fdiv double 0x409F400000000001, %25
  store double %27, double* %17, align 8
  %28 = bitcast double* %18 to <2 x double>*
  %29 = load <2 x double>, <2 x double>* %28, align 8
  %30 = fmul <2 x double> %29, <double 0x408F400000000001, double 0x409F3C0000000001>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fsub double %31, %32
  %34 = load double, double* %19, align 8
  %35 = fmul double %34, 0x408F400000000001
  %36 = fadd double %33, %35
  %37 = load double, double* %20, align 8
  %38 = fmul double %37, 0x409F400000000001
  %39 = fadd double %36, %38
  %40 = fdiv double %39, %26
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv.lver.orig
  store double %40, double* %41, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %.loopexit65, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial38 = load double, double* %scevgep30, align 8
  br label %42

; <label>:42:                                     ; preds = %42, %.ph
  %store_forwarded39 = phi double [ %load_initial38, %.ph ], [ %64, %42 ]
  %store_forwarded36 = phi double [ %load_initial, %.ph ], [ %52, %42 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %42 ]
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %13
  %46 = insertelement <2 x double> undef, double %store_forwarded36, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = fmul <2 x double> %47, <double 0x409F400000000001, double 0x409F400000000001>
  %49 = fsub <2 x double> <double 0x40AF420000000001, double 0x40AF420000000001>, %48
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  %52 = fdiv double 0x409F400000000001, %50
  store double %52, double* %43, align 8
  %53 = bitcast double* %44 to <2 x double>*
  %54 = load <2 x double>, <2 x double>* %53, align 8
  %55 = fmul <2 x double> %54, <double 0x408F400000000001, double 0x409F3C0000000001>
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %58 = fsub double %56, %57
  %59 = load double, double* %45, align 8
  %60 = fmul double %59, 0x408F400000000001
  %61 = fadd double %58, %60
  %62 = fmul double %store_forwarded39, 0x409F400000000001
  %63 = fadd double %61, %62
  %64 = fdiv double %63, %51
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv
  store double %64, double* %65, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit66, label %42

.loopexit65:                                      ; preds = %.ph.lver.orig
  br label %66

.loopexit66:                                      ; preds = %42
  br label %66

; <label>:66:                                     ; preds = %.loopexit66, %.loopexit65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv18
  store double 1.000000e+00, double* %67, align 8
  br label %68

; <label>:68:                                     ; preds = %68, %66
  %69 = phi double [ 1.000000e+00, %66 ], [ %82, %68 ]
  %indvars.iv16 = phi i64 [ 998, %66 ], [ %indvars.iv.next17.1, %68 ]
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv16
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %69
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv16
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv18
  store double %75, double* %76, align 8
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, -1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv.next17
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %75
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv.next17
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next17, i64 %indvars.iv18
  store double %82, double* %83, align 8
  %84 = icmp sgt i64 %indvars.iv.next17, 1
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, -2
  br i1 %84, label %68, label %85

; <label>:85:                                     ; preds = %68
  %86 = icmp slt i64 %13, 999
  br i1 %86, label %.lver.check, label %.lver.check54.preheader

.lver.check54.preheader:                          ; preds = %85
  br label %.lver.check54

.lver.check54:                                    ; preds = %.lver.check54.preheader, %167
  %indvar40 = phi i64 [ %87, %167 ], [ 0, %.lver.check54.preheader ]
  %indvars.iv25 = phi i64 [ %95, %167 ], [ 1, %.lver.check54.preheader ]
  %87 = add i64 %indvar40, 1
  %scevgep42 = getelementptr [1000 x double], [1000 x double]* %2, i64 %87, i64 0
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %2, i64 %87, i64 999
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %3, i64 %87, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %3, i64 %87, i64 999
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv25, i64 0
  store double 1.000000e+00, double* %88, align 8
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 0
  store double 0.000000e+00, double* %89, align 8
  %90 = bitcast double* %88 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25
  %93 = bitcast [1000 x double]* %92 to i64*
  store i64 %91, i64* %93, align 8
  %94 = add nsw i64 %indvars.iv25, -1
  %95 = add nuw nsw i64 %indvars.iv25, 1
  %bound050 = icmp ult double* %scevgep42, %scevgep48
  %bound151 = icmp ult double* %scevgep46, %scevgep44
  %memcheck.conflict53 = and i1 %bound050, %bound151
  br i1 %memcheck.conflict53, label %.ph55.lver.orig.preheader, label %.ph55

.ph55.lver.orig.preheader:                        ; preds = %.lver.check54
  br label %.ph55.lver.orig

.ph55.lver.orig:                                  ; preds = %.ph55.lver.orig.preheader, %.ph55.lver.orig
  %indvars.iv20.lver.orig = phi i64 [ %indvars.iv.next21.lver.orig, %.ph55.lver.orig ], [ 1, %.ph55.lver.orig.preheader ]
  %96 = add nsw i64 %indvars.iv20.lver.orig, -1
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 %96
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv20.lver.orig
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %94, i64 %indvars.iv20.lver.orig
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv20.lver.orig
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %95, i64 %indvars.iv20.lver.orig
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %96
  %104 = insertelement <2 x double> undef, double %98, i32 0
  %105 = shufflevector <2 x double> %104, <2 x double> undef, <2 x i32> zeroinitializer
  %106 = fmul <2 x double> %105, <double 0x408F400000000001, double 0x408F400000000001>
  %107 = fsub <2 x double> <double 0x409F440000000001, double 0x409F440000000001>, %106
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fdiv double 0x408F400000000001, %108
  store double %110, double* %99, align 8
  %111 = load double, double* %100, align 8
  %112 = fmul double %111, 0x409F400000000001
  %113 = load double, double* %101, align 8
  %114 = fmul double %113, 0x40AF3E0000000001
  %115 = fsub double %112, %114
  %116 = load double, double* %102, align 8
  %117 = fmul double %116, 0x409F400000000001
  %118 = fadd double %115, %117
  %119 = load double, double* %103, align 8
  %120 = fmul double %119, 0x408F400000000001
  %121 = fadd double %118, %120
  %122 = fdiv double %121, %109
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv20.lver.orig
  store double %122, double* %123, align 8
  %exitcond22.lver.orig = icmp eq i64 %indvars.iv20.lver.orig, 998
  %indvars.iv.next21.lver.orig = add nuw nsw i64 %indvars.iv20.lver.orig, 1
  br i1 %exitcond22.lver.orig, label %.loopexit, label %.ph55.lver.orig

.ph55:                                            ; preds = %.lver.check54
  %load_initial57 = load double, double* %scevgep42, align 8
  %load_initial62 = load double, double* %scevgep46, align 8
  br label %124

; <label>:124:                                    ; preds = %124, %.ph55
  %store_forwarded63 = phi double [ %load_initial62, %.ph55 ], [ %146, %124 ]
  %store_forwarded60 = phi double [ %load_initial57, %.ph55 ], [ %135, %124 ]
  %indvars.iv20 = phi i64 [ 1, %.ph55 ], [ %indvars.iv.next21, %124 ]
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv20
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %94, i64 %indvars.iv20
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv20
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %95, i64 %indvars.iv20
  %129 = insertelement <2 x double> undef, double %store_forwarded60, i32 0
  %130 = shufflevector <2 x double> %129, <2 x double> undef, <2 x i32> zeroinitializer
  %131 = fmul <2 x double> %130, <double 0x408F400000000001, double 0x408F400000000001>
  %132 = fsub <2 x double> <double 0x409F440000000001, double 0x409F440000000001>, %131
  %133 = extractelement <2 x double> %132, i32 0
  %134 = extractelement <2 x double> %132, i32 1
  %135 = fdiv double 0x408F400000000001, %133
  store double %135, double* %125, align 8
  %136 = load double, double* %126, align 8
  %137 = fmul double %136, 0x409F400000000001
  %138 = load double, double* %127, align 8
  %139 = fmul double %138, 0x40AF3E0000000001
  %140 = fsub double %137, %139
  %141 = load double, double* %128, align 8
  %142 = fmul double %141, 0x409F400000000001
  %143 = fadd double %140, %142
  %144 = fmul double %store_forwarded63, 0x408F400000000001
  %145 = fadd double %143, %144
  %146 = fdiv double %145, %134
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv20
  store double %146, double* %147, align 8
  %exitcond22 = icmp eq i64 %indvars.iv20, 998
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  br i1 %exitcond22, label %.loopexit64, label %124

.loopexit:                                        ; preds = %.ph55.lver.orig
  br label %148

.loopexit64:                                      ; preds = %124
  br label %148

; <label>:148:                                    ; preds = %.loopexit64, %.loopexit
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv25, i64 999
  store double 1.000000e+00, double* %149, align 8
  br label %150

; <label>:150:                                    ; preds = %150, %148
  %151 = phi double [ 1.000000e+00, %148 ], [ %164, %150 ]
  %indvars.iv23 = phi i64 [ 998, %148 ], [ %indvars.iv.next24.1, %150 ]
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv23
  %153 = load double, double* %152, align 8
  %154 = fmul double %153, %151
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv23
  %156 = load double, double* %155, align 8
  %157 = fadd double %154, %156
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv23
  store double %157, double* %158, align 8
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, -1
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next24
  %160 = load double, double* %159, align 8
  %161 = fmul double %160, %157
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv.next24
  %163 = load double, double* %162, align 8
  %164 = fadd double %161, %163
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv.next24
  store double %164, double* %165, align 8
  %166 = icmp sgt i64 %indvars.iv.next24, 1
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, -2
  br i1 %166, label %150, label %167

; <label>:167:                                    ; preds = %150
  %168 = icmp slt i64 %95, 999
  br i1 %168, label %.lver.check54, label %169

; <label>:169:                                    ; preds = %167
  %170 = add nuw nsw i32 %.09, 1
  %171 = icmp slt i32 %170, 501
  br i1 %171, label %._crit_edge, label %172

; <label>:172:                                    ; preds = %169
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
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv6 = phi i64 [ 0, %1 ], [ %indvars.iv.next7, %18 ]
  %6 = mul nsw i64 %indvars.iv6, 1000
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge4, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge4 ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge4

; <label>:11:                                     ; preds = %._crit_edge5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge5, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %17 = icmp slt i64 %indvars.iv.next, 1000
  br i1 %17, label %._crit_edge5, label %18

; <label>:18:                                     ; preds = %._crit_edge4
  %indvars.iv.next7 = add nuw i64 %indvars.iv6, 1
  %19 = icmp slt i64 %indvars.iv.next7, 1000
  br i1 %19, label %._crit_edge, label %20

; <label>:20:                                     ; preds = %18
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
