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
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv2 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next3, %._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv2, 1000
  %2 = trunc i64 %1 to i32
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %3 ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 %2, %4
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 %2, %8
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond4, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader1.lr.ph:
  br label %.preheader1

.preheader1:                                      ; preds = %._crit_edge13, %.preheader1.lr.ph
  %4 = phi i32 [ 1, %.preheader1.lr.ph ], [ %153, %._crit_edge13 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge4.us, %.preheader1
  %indvar = phi i64 [ 0, %.preheader1 ], [ %indvar.next, %._crit_edge4.us ]
  %indvars.iv18 = phi i64 [ 1, %.preheader1 ], [ %indvars.iv.next19, %._crit_edge4.us ]
  %5 = add i64 %indvar, 1
  %6 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 0
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 999
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 0
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 999
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv18
  store double 1.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 0
  store double 0.000000e+00, double* %8, align 8
  %9 = bitcast double* %7 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18
  %12 = bitcast [1000 x double]* %11 to i64*
  store i64 %10, i64* %12, align 8
  %13 = add nsw i64 %indvars.iv18, -1
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %bound0 = icmp ult double* %scevgep, %scevgep35
  %bound1 = icmp ult double* %scevgep33, %scevgep31
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
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %13
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next19
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %14
  %.rhs.lver.orig = fmul double %16, 0xC09F400000000001
  %21 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %22 = fdiv double 0x409F400000000001, %21
  store double %22, double* %17, align 8
  %23 = bitcast double* %18 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fsub double %27, %26
  %29 = load double, double* %19, align 8
  %30 = fmul double %29, 0xC08F400000000001
  %31 = fsub double %28, %30
  %32 = load double, double* %20, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = fsub double %31, %33
  %35 = fdiv double %34, %21
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv.lver.orig
  store double %35, double* %36, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep38 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %load_initial = load double, double* %scevgep37, align 8
  %load_initial39 = load double, double* %scevgep38, align 8
  br label %53

._crit_edge4.us:                                  ; preds = %.lr.ph3.us
  %exitcond28 = icmp eq i64 %indvars.iv.next19, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond28, label %.lver.check55.preheader, label %.lver.check

.lver.check55.preheader:                          ; preds = %._crit_edge4.us
  br label %.lver.check55

.lr.ph3.us:                                       ; preds = %.lr.ph3.us, %._crit_edge.us
  %indvars.iv16 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next17.1, %.lr.ph3.us ]
  %37 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %50, %.lr.ph3.us ]
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv16
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %37
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv16
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv18
  store double %43, double* %44, align 8
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, -1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv.next17
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %43
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv.next17
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next17, i64 %indvars.iv18
  store double %50, double* %51, align 8
  %52 = icmp sgt i64 %indvars.iv.next17, 1
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, -2
  br i1 %52, label %.lr.ph3.us, label %._crit_edge4.us

; <label>:53:                                     ; preds = %53, %.ph
  %store_forwarded40 = phi double [ %load_initial39, %.ph ], [ %70, %53 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %58, %53 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %53 ]
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %13
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next19
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %57 = fadd double %.rhs, 0x40AF420000000001
  %58 = fdiv double 0x409F400000000001, %57
  store double %58, double* %54, align 8
  %59 = bitcast double* %55 to <2 x double>*
  %60 = load <2 x double>, <2 x double>* %59, align 8
  %61 = fmul <2 x double> %60, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fsub double %63, %62
  %65 = load double, double* %56, align 8
  %66 = fmul double %65, 0xC08F400000000001
  %67 = fsub double %64, %66
  %68 = fmul double %store_forwarded40, 0xC09F400000000001
  %69 = fsub double %67, %68
  %70 = fdiv double %69, %57
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv
  store double %70, double* %71, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us.loopexit64, label %53

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit64:                        ; preds = %53
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit64, %._crit_edge.us.loopexit
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv18
  store double 1.000000e+00, double* %72, align 8
  br label %.lr.ph3.us

.lver.check55:                                    ; preds = %.lver.check55.preheader, %._crit_edge11.us
  %indvar41 = phi i64 [ %indvar.next42, %._crit_edge11.us ], [ 0, %.lver.check55.preheader ]
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge11.us ], [ 1, %.lver.check55.preheader ]
  %73 = add i64 %indvar41, 1
  %74 = add i64 %indvar41, 1
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %2, i64 %74, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %2, i64 %74, i64 999
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %3, i64 %74, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %3, i64 %74, i64 999
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26, i64 0
  store double 1.000000e+00, double* %75, align 8
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 0
  store double 0.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26
  %78 = bitcast [1000 x double]* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26
  %81 = bitcast [1000 x double]* %80 to i64*
  store i64 %79, i64* %81, align 8
  %82 = add nsw i64 %indvars.iv26, -1
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %bound051 = icmp ult double* %scevgep43, %scevgep49
  %bound152 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict54 = and i1 %bound051, %bound152
  br i1 %memcheck.conflict54, label %.ph56.lver.orig.preheader, label %.ph56

.ph56.lver.orig.preheader:                        ; preds = %.lver.check55
  br label %.ph56.lver.orig

.ph56.lver.orig:                                  ; preds = %.ph56.lver.orig.preheader, %.ph56.lver.orig
  %indvars.iv20.lver.orig = phi i64 [ %indvars.iv.next21.lver.orig, %.ph56.lver.orig ], [ 1, %.ph56.lver.orig.preheader ]
  %83 = add nsw i64 %indvars.iv20.lver.orig, -1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 %83
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv20.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv20.lver.orig
  %88 = insertelement <2 x double> undef, double %85, i32 0
  %89 = insertelement <2 x double> %88, double 2.000000e+00, i32 1
  %90 = fmul <2 x double> %89, <double 0xC08F400000000001, double 0xC09F400000000001>
  %91 = fadd <2 x double> %90, <double 0x409F440000000001, double 1.000000e+00>
  %92 = extractelement <2 x double> %91, i32 0
  %93 = extractelement <2 x double> %91, i32 1
  %94 = fdiv double 0x408F400000000001, %92
  store double %94, double* %86, align 8
  %95 = load double, double* %87, align 8
  %96 = fmul double %95, 0xC09F400000000001
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv20.lver.orig
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, %93
  %100 = fsub double %99, %96
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next27, i64 %indvars.iv20.lver.orig
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, 0xC09F400000000001
  %104 = fsub double %100, %103
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %83
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, 0xC08F400000000001
  %108 = fsub double %104, %107
  %109 = fdiv double %108, %92
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv20.lver.orig
  store double %109, double* %110, align 8
  %exitcond23.lver.orig = icmp eq i64 %indvars.iv20.lver.orig, 998
  %indvars.iv.next21.lver.orig = add nuw nsw i64 %indvars.iv20.lver.orig, 1
  br i1 %exitcond23.lver.orig, label %._crit_edge8.us.loopexit, label %.ph56.lver.orig

.ph56:                                            ; preds = %.lver.check55
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %3, i64 %73, i64 0
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %2, i64 %73, i64 0
  %load_initial58 = load double, double* %scevgep57, align 8
  %load_initial61 = load double, double* %scevgep60, align 8
  br label %127

._crit_edge11.us:                                 ; preds = %.lr.ph10.us
  %exitcond29 = icmp eq i64 %indvars.iv.next27, 999
  %indvar.next42 = add i64 %indvar41, 1
  br i1 %exitcond29, label %._crit_edge13, label %.lver.check55

.lr.ph10.us:                                      ; preds = %.lr.ph10.us, %._crit_edge8.us
  %indvars.iv24 = phi i64 [ 998, %._crit_edge8.us ], [ %indvars.iv.next25.1, %.lr.ph10.us ]
  %111 = phi double [ 1.000000e+00, %._crit_edge8.us ], [ %124, %.lr.ph10.us ]
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv24
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, %111
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv24
  %116 = load double, double* %115, align 8
  %117 = fadd double %114, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv24
  store double %117, double* %118, align 8
  %indvars.iv.next25 = add nsw i64 %indvars.iv24, -1
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.next25
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, %117
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv.next25
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv.next25
  store double %124, double* %125, align 8
  %126 = icmp sgt i64 %indvars.iv.next25, 1
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, -2
  br i1 %126, label %.lr.ph10.us, label %._crit_edge11.us

; <label>:127:                                    ; preds = %127, %.ph56
  %store_forwarded62 = phi double [ %load_initial61, %.ph56 ], [ %149, %127 ]
  %store_forwarded59 = phi double [ %load_initial58, %.ph56 ], [ %136, %127 ]
  %indvars.iv20 = phi i64 [ 1, %.ph56 ], [ %indvars.iv.next21, %127 ]
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv20
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv20
  %130 = insertelement <2 x double> undef, double %store_forwarded59, i32 0
  %131 = insertelement <2 x double> %130, double 2.000000e+00, i32 1
  %132 = fmul <2 x double> %131, <double 0xC08F400000000001, double 0xC09F400000000001>
  %133 = fadd <2 x double> %132, <double 0x409F440000000001, double 1.000000e+00>
  %134 = extractelement <2 x double> %133, i32 0
  %135 = extractelement <2 x double> %133, i32 1
  %136 = fdiv double 0x408F400000000001, %134
  store double %136, double* %128, align 8
  %137 = load double, double* %129, align 8
  %138 = fmul double %137, 0xC09F400000000001
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv20
  %140 = load double, double* %139, align 8
  %141 = fmul double %140, %135
  %142 = fsub double %141, %138
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next27, i64 %indvars.iv20
  %144 = load double, double* %143, align 8
  %145 = fmul double %144, 0xC09F400000000001
  %146 = fsub double %142, %145
  %147 = fmul double %store_forwarded62, 0xC08F400000000001
  %148 = fsub double %146, %147
  %149 = fdiv double %148, %134
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv20
  store double %149, double* %150, align 8
  %exitcond23 = icmp eq i64 %indvars.iv20, 998
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  br i1 %exitcond23, label %._crit_edge8.us.loopexit63, label %127

._crit_edge8.us.loopexit:                         ; preds = %.ph56.lver.orig
  br label %._crit_edge8.us

._crit_edge8.us.loopexit63:                       ; preds = %127
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %._crit_edge8.us.loopexit63, %._crit_edge8.us.loopexit
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26, i64 999
  store double 1.000000e+00, double* %151, align 8
  br label %.lr.ph10.us

._crit_edge13:                                    ; preds = %._crit_edge11.us
  %152 = icmp slt i32 %4, 500
  %153 = add nuw nsw i32 %4, 1
  br i1 %152, label %.preheader1, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
..preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv3 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next4, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv3, 1000
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond5, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
