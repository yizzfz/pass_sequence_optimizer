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
  %8 = bitcast i8* %3 to [1000 x double]*
  %9 = bitcast i8* %4 to [1000 x double]*
  %10 = bitcast i8* %5 to [1000 x double]*
  %11 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10, [1000 x double]* %11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %13
  %17 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array([1000 x double]* %17)
  br label %._crit_edge

._crit_edge:                                      ; preds = %13, %2, %16
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

.preheader:                                       ; preds = %15, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %15 ]
  %2 = add nuw nsw i64 %indvars.iv3, 1000
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %3 ]
  %4 = sub nuw nsw i64 %2, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %2, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %15, label %3

; <label>:15:                                     ; preds = %3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond, label %16, label %.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader152

.preheader152:                                    ; preds = %181, %4
  %.07 = phi i32 [ 1, %4 ], [ %182, %181 ]
  br label %.lver.check

.lver.check:                                      ; preds = %92, %.preheader152
  %indvar = phi i64 [ %indvar.next, %92 ], [ 0, %.preheader152 ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %92 ], [ 1, %.preheader152 ]
  %5 = add i64 %indvar, 1
  %6 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 0
  %scevgep23 = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 999
  %scevgep25 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 0
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 999
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv10
  store double 1.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 0
  store double 0.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv10
  %10 = bitcast double* %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv10, -1
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %bound0 = icmp ult double* %scevgep, %scevgep27
  %bound1 = icmp ult double* %scevgep25, %scevgep23
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv.lver.orig
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %14
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next11
  %21 = add nsw i64 %indvars.iv.lver.orig, -1
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %21
  %23 = add nsw i64 %indvars.iv.lver.orig, -1
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %23
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %17, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %27, <double 0xC09F400000000001, double 0xC09F400000000001>
  %29 = fadd <2 x double> %28, <double 0x40AF420000000001, double 0x40AF420000000001>
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fdiv double 0x409F400000000001, %30
  store double %32, double* %18, align 8
  %33 = bitcast double* %19 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %33, align 8
  %35 = fmul <2 x double> %34, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  %38 = fadd double %36, %37
  %39 = load double, double* %20, align 8
  %40 = fmul double %39, 0x408F400000000001
  %41 = fadd double %40, %38
  %42 = load double, double* %22, align 8
  %43 = fmul double %42, 0x409F400000000001
  %44 = fadd double %43, %41
  %45 = fdiv double %44, %31
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv.lver.orig
  store double %45, double* %46, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit60, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep32 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %load_initial = load double, double* %scevgep29, align 8
  %load_initial33 = load double, double* %scevgep32, align 8
  br label %47

; <label>:47:                                     ; preds = %47, %.ph
  %store_forwarded34 = phi double [ %load_initial33, %.ph ], [ %69, %47 ]
  %store_forwarded31 = phi double [ %load_initial, %.ph ], [ %57, %47 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %47 ]
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %14
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next11
  %51 = insertelement <2 x double> undef, double %store_forwarded31, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = fmul <2 x double> %52, <double 0xC09F400000000001, double 0xC09F400000000001>
  %54 = fadd <2 x double> %53, <double 0x40AF420000000001, double 0x40AF420000000001>
  %55 = extractelement <2 x double> %54, i32 0
  %56 = extractelement <2 x double> %54, i32 1
  %57 = fdiv double 0x409F400000000001, %55
  store double %57, double* %48, align 8
  %58 = bitcast double* %49 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 8
  %60 = fmul <2 x double> %59, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fadd double %61, %62
  %64 = load double, double* %50, align 8
  %65 = fmul double %64, 0x408F400000000001
  %66 = fadd double %65, %63
  %67 = fmul double %store_forwarded34, 0x409F400000000001
  %68 = fadd double %67, %66
  %69 = fdiv double %68, %56
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  store double %69, double* %70, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.loopexit61, label %47

.loopexit60:                                      ; preds = %.ph.lver.orig
  br label %71

.loopexit61:                                      ; preds = %47
  br label %71

; <label>:71:                                     ; preds = %.loopexit61, %.loopexit60
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv10
  store double 1.000000e+00, double* %72, align 8
  br label %73

; <label>:73:                                     ; preds = %73, %71
  %indvars.iv8 = phi i64 [ 998, %71 ], [ %indvars.iv.next9.1, %73 ]
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv8
  %75 = load double, double* %74, align 8
  %76 = or i64 %indvars.iv8, 1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %76, i64 %indvars.iv10
  %78 = load double, double* %77, align 8
  %79 = fmul double %75, %78
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv8
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv10
  store double %82, double* %83, align 8
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, -1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv.next9
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, %82
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv.next9
  %88 = load double, double* %87, align 8
  %89 = fadd double %86, %88
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next9, i64 %indvars.iv10
  store double %89, double* %90, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, -2
  %91 = icmp sgt i64 %indvars.iv.next9, 1
  br i1 %91, label %73, label %92

; <label>:92:                                     ; preds = %73
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond12, label %.lver.check49.preheader, label %.lver.check

.lver.check49.preheader:                          ; preds = %92
  br label %.lver.check49

.lver.check49:                                    ; preds = %.lver.check49.preheader, %180
  %indvar35 = phi i64 [ %indvar.next36, %180 ], [ 0, %.lver.check49.preheader ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %180 ], [ 1, %.lver.check49.preheader ]
  %93 = add i64 %indvar35, 1
  %94 = add i64 %indvar35, 1
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %2, i64 %94, i64 0
  %scevgep39 = getelementptr [1000 x double], [1000 x double]* %2, i64 %94, i64 999
  %scevgep41 = getelementptr [1000 x double], [1000 x double]* %3, i64 %94, i64 0
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %3, i64 %94, i64 999
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 0
  store double 1.000000e+00, double* %95, align 8
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 0
  store double 0.000000e+00, double* %96, align 8
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 0
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18
  %101 = bitcast [1000 x double]* %100 to i64*
  store i64 %99, i64* %101, align 8
  %102 = add nsw i64 %indvars.iv18, -1
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %bound045 = icmp ult double* %scevgep37, %scevgep43
  %bound146 = icmp ult double* %scevgep41, %scevgep39
  %memcheck.conflict48 = and i1 %bound045, %bound146
  br i1 %memcheck.conflict48, label %.ph50.lver.orig.preheader, label %.ph50

.ph50.lver.orig.preheader:                        ; preds = %.lver.check49
  br label %.ph50.lver.orig

.ph50.lver.orig:                                  ; preds = %.ph50.lver.orig.preheader, %.ph50.lver.orig
  %indvars.iv13.lver.orig = phi i64 [ %indvars.iv.next14.lver.orig, %.ph50.lver.orig ], [ 1, %.ph50.lver.orig.preheader ]
  %103 = add nsw i64 %indvars.iv13.lver.orig, -1
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %103
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv13.lver.orig
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %102, i64 %indvars.iv13.lver.orig
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv13.lver.orig
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next19, i64 %indvars.iv13.lver.orig
  %110 = add nsw i64 %indvars.iv13.lver.orig, -1
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %110
  %112 = add nsw i64 %indvars.iv13.lver.orig, -1
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %112
  %114 = load double, double* %113, align 8
  %115 = insertelement <2 x double> undef, double %105, i32 0
  %116 = insertelement <2 x double> %115, double %114, i32 1
  %117 = fmul <2 x double> %116, <double 0xC08F400000000001, double 0xC08F400000000001>
  %118 = fadd <2 x double> %117, <double 0x409F440000000001, double 0x409F440000000001>
  %119 = extractelement <2 x double> %118, i32 0
  %120 = extractelement <2 x double> %118, i32 1
  %121 = fdiv double 0x408F400000000001, %119
  store double %121, double* %106, align 8
  %122 = load double, double* %107, align 8
  %123 = fmul double %122, 0x409F400000000001
  %124 = load double, double* %108, align 8
  %125 = fmul double %124, 0x40AF3E0000000001
  %126 = fsub double %123, %125
  %127 = load double, double* %109, align 8
  %128 = fmul double %127, 0x409F400000000001
  %129 = fadd double %126, %128
  %130 = load double, double* %111, align 8
  %131 = fmul double %130, 0x408F400000000001
  %132 = fadd double %129, %131
  %133 = fdiv double %132, %120
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv13.lver.orig
  store double %133, double* %134, align 8
  %indvars.iv.next14.lver.orig = add nuw nsw i64 %indvars.iv13.lver.orig, 1
  %exitcond15.lver.orig = icmp eq i64 %indvars.iv.next14.lver.orig, 999
  br i1 %exitcond15.lver.orig, label %.loopexit, label %.ph50.lver.orig

.ph50:                                            ; preds = %.lver.check49
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %2, i64 %93, i64 0
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %3, i64 %93, i64 0
  %load_initial52 = load double, double* %scevgep51, align 8
  %load_initial57 = load double, double* %scevgep56, align 8
  br label %135

; <label>:135:                                    ; preds = %135, %.ph50
  %store_forwarded58 = phi double [ %load_initial57, %.ph50 ], [ %157, %135 ]
  %store_forwarded55 = phi double [ %load_initial52, %.ph50 ], [ %146, %135 ]
  %indvars.iv13 = phi i64 [ 1, %.ph50 ], [ %indvars.iv.next14, %135 ]
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv13
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %102, i64 %indvars.iv13
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv13
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next19, i64 %indvars.iv13
  %140 = insertelement <2 x double> undef, double %store_forwarded55, i32 0
  %141 = shufflevector <2 x double> %140, <2 x double> undef, <2 x i32> zeroinitializer
  %142 = fmul <2 x double> %141, <double 0xC08F400000000001, double 0xC08F400000000001>
  %143 = fadd <2 x double> %142, <double 0x409F440000000001, double 0x409F440000000001>
  %144 = extractelement <2 x double> %143, i32 0
  %145 = extractelement <2 x double> %143, i32 1
  %146 = fdiv double 0x408F400000000001, %144
  store double %146, double* %136, align 8
  %147 = load double, double* %137, align 8
  %148 = fmul double %147, 0x409F400000000001
  %149 = load double, double* %138, align 8
  %150 = fmul double %149, 0x40AF3E0000000001
  %151 = fsub double %148, %150
  %152 = load double, double* %139, align 8
  %153 = fmul double %152, 0x409F400000000001
  %154 = fadd double %151, %153
  %155 = fmul double %store_forwarded58, 0x408F400000000001
  %156 = fadd double %154, %155
  %157 = fdiv double %156, %145
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv13
  store double %157, double* %158, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 999
  br i1 %exitcond15, label %.loopexit59, label %135

.loopexit:                                        ; preds = %.ph50.lver.orig
  br label %159

.loopexit59:                                      ; preds = %135
  br label %159

; <label>:159:                                    ; preds = %.loopexit59, %.loopexit
  %160 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 999
  store double 1.000000e+00, double* %160, align 8
  br label %161

; <label>:161:                                    ; preds = %161, %159
  %indvars.iv16 = phi i64 [ 998, %159 ], [ %indvars.iv.next17.1, %161 ]
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv16
  %163 = load double, double* %162, align 8
  %164 = or i64 %indvars.iv16, 1
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %164
  %166 = load double, double* %165, align 8
  %167 = fmul double %163, %166
  %168 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv16
  %169 = load double, double* %168, align 8
  %170 = fadd double %167, %169
  %171 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv16
  store double %170, double* %171, align 8
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, -1
  %172 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv.next17
  %173 = load double, double* %172, align 8
  %174 = fmul double %173, %170
  %175 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv.next17
  %176 = load double, double* %175, align 8
  %177 = fadd double %174, %176
  %178 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next17
  store double %177, double* %178, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, -2
  %179 = icmp sgt i64 %indvars.iv.next17, 1
  br i1 %179, label %161, label %180

; <label>:180:                                    ; preds = %161
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 999
  %indvar.next36 = add i64 %indvar35, 1
  br i1 %exitcond20, label %181, label %.lver.check49

; <label>:181:                                    ; preds = %180
  %182 = add nuw nsw i32 %.07, 1
  %exitcond21 = icmp eq i32 %182, 501
  br i1 %exitcond21, label %183, label %.preheader152

; <label>:183:                                    ; preds = %181
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

.preheader:                                       ; preds = %18, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv3, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond5, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
