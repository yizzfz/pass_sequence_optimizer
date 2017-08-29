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
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array([1000 x double]* %7)
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
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #0 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %14, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %14 ]
  %2 = add nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %3 = sub nuw nsw i64 %2, %indvars.iv
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = sub nuw nsw i64 %2, %indvars.iv.next
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %5, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fdiv <2 x double> %11, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond.1, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %15, label %._crit_edge.preheader

; <label>:15:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge4._crit_edge, %4
  %.0318 = phi i32 [ 1, %4 ], [ %150, %._crit_edge4._crit_edge ]
  br label %._crit_edge12.lver.check

._crit_edge12.lver.check:                         ; preds = %._crit_edge.us, %._crit_edge.preheader
  %indvar = phi i64 [ %5, %._crit_edge.us ], [ 0, %._crit_edge.preheader ]
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge.us ], [ 1, %._crit_edge.preheader ]
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep17 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep19 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep21 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv3
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv3, -1
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %bound0 = icmp ult double* %scevgep, %scevgep21
  %bound1 = icmp ult double* %scevgep19, %scevgep17
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge12.lver.orig.preheader, label %._crit_edge12.ph

._crit_edge12.lver.orig.preheader:                ; preds = %._crit_edge12.lver.check
  br label %._crit_edge12.lver.orig

._crit_edge12.lver.orig:                          ; preds = %._crit_edge12.lver.orig.preheader, %._crit_edge12.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge12.lver.orig ], [ 1, %._crit_edge12.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %13
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.lver.orig
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next4
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %13
  %.lhs.lver.orig = fmul double %15, 0xC09F400000000001
  %20 = fadd double %.lhs.lver.orig, 0x40AF420000000001
  %21 = fdiv double 0x409F400000000001, %20
  store double %21, double* %16, align 8
  %22 = bitcast double* %17 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fsub double %26, %25
  %28 = load double, double* %18, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %27, %29
  %31 = load double, double* %19, align 8
  %32 = fmul double %31, 0xC09F400000000001
  %33 = fsub double %30, %32
  %34 = fdiv double %33, %20
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv.lver.orig
  store double %34, double* %35, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  br i1 %exitcond.lver.orig, label %._crit_edge7.us.loopexit, label %._crit_edge12.lver.orig

._crit_edge12.ph:                                 ; preds = %._crit_edge12.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial25 = load double, double* %scevgep19, align 8
  br label %._crit_edge12

._crit_edge.us:                                   ; preds = %36
  %exitcond14 = icmp eq i64 %indvars.iv.next4, 999
  br i1 %exitcond14, label %._crit_edge13.lver.check.preheader, label %._crit_edge12.lver.check

._crit_edge13.lver.check.preheader:               ; preds = %._crit_edge.us
  br label %._crit_edge13.lver.check

; <label>:36:                                     ; preds = %36, %._crit_edge7.us
  %indvars.iv1 = phi i64 [ 998, %._crit_edge7.us ], [ %indvars.iv.next2.1, %36 ]
  %37 = phi double [ 1.000000e+00, %._crit_edge7.us ], [ %50, %36 ]
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv1
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %37
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv1
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv3
  store double %43, double* %44, align 8
  %indvars.iv.next2 = add nsw i64 %indvars.iv1, -1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.next2
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %43
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv.next2
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next2, i64 %indvars.iv3
  store double %50, double* %51, align 8
  %52 = icmp sgt i64 %indvars.iv.next2, 1
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv1, -2
  br i1 %52, label %36, label %._crit_edge.us

._crit_edge12:                                    ; preds = %._crit_edge12, %._crit_edge12.ph
  %store_forwarded26 = phi double [ %load_initial25, %._crit_edge12.ph ], [ %69, %._crit_edge12 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge12.ph ], [ %57, %._crit_edge12 ]
  %indvars.iv = phi i64 [ 1, %._crit_edge12.ph ], [ %indvars.iv.next, %._crit_edge12 ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next4
  %.lhs = fmul double %store_forwarded, 0xC09F400000000001
  %56 = fadd double %.lhs, 0x40AF420000000001
  %57 = fdiv double 0x409F400000000001, %56
  store double %57, double* %53, align 8
  %58 = bitcast double* %54 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 8
  %60 = fmul <2 x double> %59, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fsub double %62, %61
  %64 = load double, double* %55, align 8
  %65 = fmul double %64, 0xC08F400000000001
  %66 = fsub double %63, %65
  %67 = fmul double %store_forwarded26, 0xC09F400000000001
  %68 = fsub double %66, %67
  %69 = fdiv double %68, %56
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  store double %69, double* %70, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, 998
  br i1 %exitcond, label %._crit_edge7.us.loopexit48, label %._crit_edge12

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge12.lver.orig
  br label %._crit_edge7.us

._crit_edge7.us.loopexit48:                       ; preds = %._crit_edge12
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit48, %._crit_edge7.us.loopexit
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv3
  store double 1.000000e+00, double* %71, align 8
  br label %36

._crit_edge13.lver.check:                         ; preds = %._crit_edge13.lver.check.preheader, %._crit_edge4.us
  %indvar27 = phi i64 [ %72, %._crit_edge4.us ], [ 0, %._crit_edge13.lver.check.preheader ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge4.us ], [ 1, %._crit_edge13.lver.check.preheader ]
  %72 = add i64 %indvar27, 1
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %2, i64 %72, i64 0
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %2, i64 %72, i64 999
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %3, i64 %72, i64 0
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %3, i64 %72, i64 999
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 0
  store double 1.000000e+00, double* %73, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 0
  store double 0.000000e+00, double* %74, align 8
  %75 = bitcast double* %73 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10
  %78 = bitcast [1000 x double]* %77 to i64*
  store i64 %76, i64* %78, align 8
  %79 = add nsw i64 %indvars.iv10, -1
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %bound037 = icmp ult double* %scevgep29, %scevgep35
  %bound138 = icmp ult double* %scevgep33, %scevgep31
  %memcheck.conflict40 = and i1 %bound037, %bound138
  br i1 %memcheck.conflict40, label %._crit_edge13.lver.orig.preheader, label %._crit_edge13.ph

._crit_edge13.lver.orig.preheader:                ; preds = %._crit_edge13.lver.check
  br label %._crit_edge13.lver.orig

._crit_edge13.lver.orig:                          ; preds = %._crit_edge13.lver.orig.preheader, %._crit_edge13.lver.orig
  %indvars.iv5.lver.orig = phi i64 [ %indvars.iv.next6.lver.orig, %._crit_edge13.lver.orig ], [ 1, %._crit_edge13.lver.orig.preheader ]
  %80 = add nsw i64 %indvars.iv5.lver.orig, -1
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %80
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv5.lver.orig
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %80
  %88 = insertelement <2 x double> undef, double %82, i32 0
  %89 = shufflevector <2 x double> %88, <2 x double> undef, <2 x i32> zeroinitializer
  %90 = fmul <2 x double> %89, <double 0xC08F400000000001, double 0xC08F400000000001>
  %91 = fadd <2 x double> %90, <double 0x409F440000000001, double 0x409F440000000001>
  %92 = extractelement <2 x double> %91, i32 0
  %93 = extractelement <2 x double> %91, i32 1
  %94 = fdiv double 0x408F400000000001, %92
  store double %94, double* %83, align 8
  %95 = load double, double* %84, align 8
  %96 = fmul double %95, 0xC09F400000000001
  %97 = load double, double* %85, align 8
  %98 = fmul double %97, 0xC0AF3E0000000001
  %99 = fsub double %98, %96
  %100 = load double, double* %86, align 8
  %101 = fmul double %100, 0xC09F400000000001
  %102 = fsub double %99, %101
  %103 = load double, double* %87, align 8
  %104 = fmul double %103, 0xC08F400000000001
  %105 = fsub double %102, %104
  %106 = fdiv double %105, %93
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  store double %106, double* %107, align 8
  %indvars.iv.next6.lver.orig = add nuw nsw i64 %indvars.iv5.lver.orig, 1
  %exitcond7.lver.orig = icmp eq i64 %indvars.iv5.lver.orig, 998
  br i1 %exitcond7.lver.orig, label %._crit_edge14.us.loopexit, label %._crit_edge13.lver.orig

._crit_edge13.ph:                                 ; preds = %._crit_edge13.lver.check
  %load_initial42 = load double, double* %scevgep29, align 8
  %load_initial45 = load double, double* %scevgep33, align 8
  br label %._crit_edge13

._crit_edge4.us:                                  ; preds = %108
  %exitcond15 = icmp eq i64 %indvars.iv.next11, 999
  br i1 %exitcond15, label %._crit_edge4._crit_edge, label %._crit_edge13.lver.check

; <label>:108:                                    ; preds = %108, %._crit_edge14.us
  %indvars.iv8 = phi i64 [ 998, %._crit_edge14.us ], [ %indvars.iv.next9.1, %108 ]
  %109 = phi double [ 1.000000e+00, %._crit_edge14.us ], [ %122, %108 ]
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv8
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %109
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv8
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv8
  store double %115, double* %116, align 8
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, -1
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv.next9
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, %115
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv.next9
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv.next9
  store double %122, double* %123, align 8
  %124 = icmp sgt i64 %indvars.iv.next9, 1
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, -2
  br i1 %124, label %108, label %._crit_edge4.us

._crit_edge13:                                    ; preds = %._crit_edge13, %._crit_edge13.ph
  %store_forwarded46 = phi double [ %load_initial45, %._crit_edge13.ph ], [ %146, %._crit_edge13 ]
  %store_forwarded43 = phi double [ %load_initial42, %._crit_edge13.ph ], [ %135, %._crit_edge13 ]
  %indvars.iv5 = phi i64 [ 1, %._crit_edge13.ph ], [ %indvars.iv.next6, %._crit_edge13 ]
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv5
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5
  %129 = insertelement <2 x double> undef, double %store_forwarded43, i32 0
  %130 = shufflevector <2 x double> %129, <2 x double> undef, <2 x i32> zeroinitializer
  %131 = fmul <2 x double> %130, <double 0xC08F400000000001, double 0xC08F400000000001>
  %132 = fadd <2 x double> %131, <double 0x409F440000000001, double 0x409F440000000001>
  %133 = extractelement <2 x double> %132, i32 0
  %134 = extractelement <2 x double> %132, i32 1
  %135 = fdiv double 0x408F400000000001, %133
  store double %135, double* %125, align 8
  %136 = load double, double* %126, align 8
  %137 = fmul double %136, 0xC09F400000000001
  %138 = load double, double* %127, align 8
  %139 = fmul double %138, 0xC0AF3E0000000001
  %140 = fsub double %139, %137
  %141 = load double, double* %128, align 8
  %142 = fmul double %141, 0xC09F400000000001
  %143 = fsub double %140, %142
  %144 = fmul double %store_forwarded46, 0xC08F400000000001
  %145 = fsub double %143, %144
  %146 = fdiv double %145, %134
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5
  store double %146, double* %147, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv5, 998
  br i1 %exitcond7, label %._crit_edge14.us.loopexit47, label %._crit_edge13

._crit_edge14.us.loopexit:                        ; preds = %._crit_edge13.lver.orig
  br label %._crit_edge14.us

._crit_edge14.us.loopexit47:                      ; preds = %._crit_edge13
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit47, %._crit_edge14.us.loopexit
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 999
  store double 1.000000e+00, double* %148, align 8
  br label %108

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4.us
  %149 = icmp sgt i32 %.0318, 499
  %150 = add nuw nsw i32 %.0318, 1
  br i1 %149, label %151, label %._crit_edge.preheader

; <label>:151:                                    ; preds = %._crit_edge4._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2

; <label>:11:                                     ; preds = %._crit_edge2._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge2._crit_edge

; <label>:17:                                     ; preds = %._crit_edge2
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %._crit_edge.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
