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
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge._crit_edge.us ]
  %2 = add i64 %indvars.iv5, 1000
  %3 = trunc i64 %2 to i32
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next.1, %._crit_edge.us ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 %3, %4
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 %3, %8
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond9.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond9.1, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %._crit_edge.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge4._crit_edge, %._crit_edge.preheader.lr.ph
  %.0324 = phi i32 [ 1, %._crit_edge.preheader.lr.ph ], [ %147, %._crit_edge4._crit_edge ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge.preheader, %._crit_edge.us
  %indvar = phi i64 [ 0, %._crit_edge.preheader ], [ %indvar.next, %._crit_edge.us ]
  %indvars.iv28 = phi i64 [ 1, %._crit_edge.preheader ], [ %indvars.iv.next29, %._crit_edge.us ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep50 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv28
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv28, -1
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %bound0 = icmp ult double* %scevgep, %scevgep50
  %bound1 = icmp ult double* %scevgep48, %scevgep46
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %15
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 0xC09F400000000001
  %19 = fadd double %18, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fsub double %27, %26
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next29
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %28, %31
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %15
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, 0xC09F400000000001
  %36 = fsub double %32, %35
  %37 = fdiv double %36, %19
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  store double %37, double* %38, align 8
  %exitcond44.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond44.lver.orig, label %._crit_edge7.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep52 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep52, align 8
  %load_initial54 = load double, double* %scevgep53, align 8
  br label %55

._crit_edge.us:                                   ; preds = %.lr.ph10.us
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond31, label %.lver.check70.preheader, label %.lver.check

.lver.check70.preheader:                          ; preds = %._crit_edge.us
  br label %.lver.check70

.lr.ph10.us:                                      ; preds = %.lr.ph10.us, %._crit_edge7.us
  %indvars.iv26 = phi i64 [ 998, %._crit_edge7.us ], [ %indvars.iv.next27.1, %.lr.ph10.us ]
  %39 = phi double [ 1.000000e+00, %._crit_edge7.us ], [ %52, %.lr.ph10.us ]
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv26
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %39
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv26
  %44 = load double, double* %43, align 8
  %45 = fadd double %42, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv28
  store double %45, double* %46, align 8
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.next27
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %45
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv.next27
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next27, i64 %indvars.iv28
  store double %52, double* %53, align 8
  %54 = icmp sgt i64 %indvars.iv.next27, 1
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, -2
  br i1 %54, label %.lr.ph10.us, label %._crit_edge.us

; <label>:55:                                     ; preds = %55, %.ph
  %store_forwarded55 = phi double [ %load_initial54, %.ph ], [ %73, %55 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %58, %55 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %55 ]
  %56 = fmul double %store_forwarded, 0xC09F400000000001
  %57 = fadd double %56, 0x40AF420000000001
  %58 = fdiv double 0x409F400000000001, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  store double %58, double* %59, align 8
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %61 = bitcast double* %60 to <2 x double>*
  %62 = load <2 x double>, <2 x double>* %61, align 8
  %63 = fmul <2 x double> %62, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %64 = extractelement <2 x double> %63, i32 0
  %65 = extractelement <2 x double> %63, i32 1
  %66 = fsub double %65, %64
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next29
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, 0xC08F400000000001
  %70 = fsub double %66, %69
  %71 = fmul double %store_forwarded55, 0xC09F400000000001
  %72 = fsub double %70, %71
  %73 = fdiv double %72, %57
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv
  store double %73, double* %74, align 8
  %exitcond44 = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond44, label %._crit_edge7.us.loopexit79, label %55

._crit_edge7.us.loopexit:                         ; preds = %.ph.lver.orig
  br label %._crit_edge7.us

._crit_edge7.us.loopexit79:                       ; preds = %55
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit79, %._crit_edge7.us.loopexit
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv28
  store double 1.000000e+00, double* %75, align 8
  br label %.lr.ph10.us

.lver.check70:                                    ; preds = %.lver.check70.preheader, %._crit_edge4.us
  %indvar56 = phi i64 [ %indvar.next57, %._crit_edge4.us ], [ 0, %.lver.check70.preheader ]
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge4.us ], [ 1, %.lver.check70.preheader ]
  %76 = add i64 %indvar56, 1
  %77 = add i64 %indvar56, 1
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %4, i64 %77, i64 0
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %4, i64 %77, i64 999
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %5, i64 %77, i64 0
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %5, i64 %77, i64 999
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 0, i64 0
  store double 1.000000e+00, double* %79, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 0
  store double 0.000000e+00, double* %80, align 8
  %81 = bitcast [1000 x double]* %78 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38
  %84 = bitcast [1000 x double]* %83 to i64*
  store i64 %82, i64* %84, align 8
  %85 = add nsw i64 %indvars.iv38, -1
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %bound066 = icmp ult double* %scevgep58, %scevgep64
  %bound167 = icmp ult double* %scevgep62, %scevgep60
  %memcheck.conflict69 = and i1 %bound066, %bound167
  br i1 %memcheck.conflict69, label %.ph71.lver.orig.preheader, label %.ph71

.ph71.lver.orig.preheader:                        ; preds = %.lver.check70
  br label %.ph71.lver.orig

.ph71.lver.orig:                                  ; preds = %.ph71.lver.orig.preheader, %.ph71.lver.orig
  %indvars.iv32.lver.orig = phi i64 [ %indvars.iv.next33.lver.orig, %.ph71.lver.orig ], [ 1, %.ph71.lver.orig.preheader ]
  %86 = add nsw i64 %indvars.iv32.lver.orig, -1
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %86
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, 0xC08F400000000001
  %90 = fadd double %89, 0x409F440000000001
  %91 = fdiv double 0x408F400000000001, %90
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  store double %91, double* %92, align 8
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %85, i64 %indvars.iv32.lver.orig
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, 0xC09F400000000001
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  %97 = load double, double* %96, align 8
  %98 = fmul double %97, 0xC0AF3E0000000001
  %99 = fsub double %98, %95
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next39, i64 %indvars.iv32.lver.orig
  %101 = load double, double* %100, align 8
  %102 = fmul double %101, 0xC09F400000000001
  %103 = fsub double %99, %102
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %86
  %105 = load double, double* %104, align 8
  %106 = fmul double %105, 0xC08F400000000001
  %107 = fsub double %103, %106
  %108 = fdiv double %107, %90
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  store double %108, double* %109, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv32.lver.orig, 998
  %indvars.iv.next33.lver.orig = add nuw nsw i64 %indvars.iv32.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge17.us.loopexit, label %.ph71.lver.orig

.ph71:                                            ; preds = %.lver.check70
  %scevgep75 = getelementptr [1000 x double], [1000 x double]* %5, i64 %76, i64 0
  %scevgep72 = getelementptr [1000 x double], [1000 x double]* %4, i64 %76, i64 0
  %load_initial73 = load double, double* %scevgep72, align 8
  %load_initial76 = load double, double* %scevgep75, align 8
  br label %126

._crit_edge4.us:                                  ; preds = %.lr.ph20.us
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 999
  %indvar.next57 = add i64 %indvar56, 1
  br i1 %exitcond41, label %._crit_edge4._crit_edge, label %.lver.check70

.lr.ph20.us:                                      ; preds = %.lr.ph20.us, %._crit_edge17.us
  %indvars.iv36 = phi i64 [ 998, %._crit_edge17.us ], [ %indvars.iv.next37.1, %.lr.ph20.us ]
  %110 = phi double [ 1.000000e+00, %._crit_edge17.us ], [ %123, %.lr.ph20.us ]
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv36
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, %110
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv36
  %115 = load double, double* %114, align 8
  %116 = fadd double %113, %115
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv36
  store double %116, double* %117, align 8
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, -1
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next37
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, %116
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next37
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next37
  store double %123, double* %124, align 8
  %125 = icmp sgt i64 %indvars.iv.next37, 1
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, -2
  br i1 %125, label %.lr.ph20.us, label %._crit_edge4.us

; <label>:126:                                    ; preds = %126, %.ph71
  %store_forwarded77 = phi double [ %load_initial76, %.ph71 ], [ %144, %126 ]
  %store_forwarded74 = phi double [ %load_initial73, %.ph71 ], [ %129, %126 ]
  %indvars.iv32 = phi i64 [ 1, %.ph71 ], [ %indvars.iv.next33, %126 ]
  %127 = fmul double %store_forwarded74, 0xC08F400000000001
  %128 = fadd double %127, 0x409F440000000001
  %129 = fdiv double 0x408F400000000001, %128
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv32
  store double %129, double* %130, align 8
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %85, i64 %indvars.iv32
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, 0xC09F400000000001
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv32
  %135 = load double, double* %134, align 8
  %136 = fmul double %135, 0xC0AF3E0000000001
  %137 = fsub double %136, %133
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next39, i64 %indvars.iv32
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, 0xC09F400000000001
  %141 = fsub double %137, %140
  %142 = fmul double %store_forwarded77, 0xC08F400000000001
  %143 = fsub double %141, %142
  %144 = fdiv double %143, %128
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv32
  store double %144, double* %145, align 8
  %exitcond = icmp eq i64 %indvars.iv32, 998
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  br i1 %exitcond, label %._crit_edge17.us.loopexit78, label %126

._crit_edge17.us.loopexit:                        ; preds = %.ph71.lver.orig
  br label %._crit_edge17.us

._crit_edge17.us.loopexit78:                      ; preds = %126
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit78, %._crit_edge17.us.loopexit
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 999
  store double 1.000000e+00, double* %146, align 8
  br label %.lr.ph20.us

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4.us
  %exitcond42 = icmp eq i32 %.0324, 500
  %147 = add nuw nsw i32 %.0324, 1
  br i1 %exitcond42, label %._crit_edge25, label %._crit_edge.preheader

._crit_edge25:                                    ; preds = %._crit_edge4._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
._crit_edge.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv5, 1000
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2.us

; <label>:11:                                     ; preds = %._crit_edge2.us._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge2.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge, label %._crit_edge.preheader.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
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
