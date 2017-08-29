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
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call void @print_array([1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1000 x double]*) #0 {
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
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv
  store double %7, double* %8, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub nuw nsw i32 %2, %9
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next
  store double %12, double* %13, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond1, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) #0 {
.preheader22.lr.ph:
  br label %.preheader22

.preheader22:                                     ; preds = %._crit_edge36, %.preheader22.lr.ph
  %4 = phi i32 [ 1, %.preheader22.lr.ph ], [ %156, %._crit_edge36 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge26.us, %.preheader22
  %indvar = phi i64 [ 0, %.preheader22 ], [ %indvar.next, %._crit_edge26.us ]
  %indvars.iv46 = phi i64 [ 1, %.preheader22 ], [ %indvars.iv.next47, %._crit_edge26.us ]
  %5 = add nuw nsw i64 %indvar, 1
  %6 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 0
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 999
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 0
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 999
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv46
  store double 1.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv46, i64 0
  store double 0.000000e+00, double* %8, align 8
  %9 = bitcast double* %7 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv46
  %12 = bitcast [1000 x double]* %11 to i64*
  store i64 %10, i64* %12, align 8
  %13 = add nsw i64 %indvars.iv46, -1
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %bound0 = icmp ult double* %scevgep, %scevgep61
  %bound1 = icmp ult double* %scevgep59, %scevgep57
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv42.lver.orig = phi i64 [ %indvars.iv.next43.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %14 = add nsw i64 %indvars.iv42.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv46, i64 %14
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv42.lver.orig
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv42.lver.orig, i64 %13
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv42.lver.orig, i64 %indvars.iv.next47
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv46, i64 %14
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = fmul <2 x double> %21, <double 0xC09F400000000001, double 0xC08F400000000001>
  %23 = fadd <2 x double> %22, <double 0x40AF420000000001, double 0x409F440000000001>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 0
  %26 = fdiv double 0x409F400000000001, %24
  store double %26, double* %17, align 8
  %27 = bitcast double* %18 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %29 = fmul <2 x double> %28, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fsub double %31, %30
  %33 = load double, double* %19, align 8
  %34 = fmul double %33, 0xC08F400000000001
  %35 = fsub double %32, %34
  %36 = load double, double* %20, align 8
  %37 = fmul double %36, 0xC09F400000000001
  %38 = fsub double %35, %37
  %39 = fdiv double %38, %25
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv42.lver.orig
  store double %39, double* %40, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv42.lver.orig, 998
  %indvars.iv.next43.lver.orig = add nuw nsw i64 %indvars.iv42.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %load_initial = load double, double* %scevgep63, align 8
  %load_initial65 = load double, double* %scevgep64, align 8
  br label %59

._crit_edge26.us:                                 ; preds = %.lr.ph25.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond3 = icmp eq i64 %indvar.next, 998
  br i1 %exitcond3, label %.lver.check81.preheader, label %.lver.check

.lver.check81.preheader:                          ; preds = %._crit_edge26.us
  br label %.lver.check81

.lr.ph25.us:                                      ; preds = %.lr.ph25.us, %._crit_edge.us
  %indvars.iv44 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next45.1, %.lr.ph25.us ]
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv44
  %42 = load double, double* %41, align 8
  %43 = or i64 %indvars.iv44, 1
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %43, i64 %indvars.iv46
  %45 = load double, double* %44, align 8
  %46 = fmul double %42, %45
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv44
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv44, i64 %indvars.iv46
  store double %49, double* %50, align 8
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, -1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv.next45
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %49
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv.next45
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next45, i64 %indvars.iv46
  store double %56, double* %57, align 8
  %58 = icmp sgt i64 %indvars.iv.next45, 1
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, -2
  br i1 %58, label %.lr.ph25.us, label %._crit_edge26.us

; <label>:59:                                     ; preds = %59, %.ph
  %store_forwarded66 = phi double [ %load_initial65, %.ph ], [ %80, %59 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %68, %59 ]
  %indvars.iv42 = phi i64 [ 1, %.ph ], [ %indvars.iv.next43, %59 ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv42
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv42, i64 %13
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv.next47
  %63 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %64 = fmul <2 x double> %63, <double 0xC09F400000000001, double 0xC08F400000000001>
  %65 = fadd <2 x double> %64, <double 0x40AF420000000001, double 0x409F440000000001>
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 0
  %68 = fdiv double 0x409F400000000001, %66
  store double %68, double* %60, align 8
  %69 = bitcast double* %61 to <2 x double>*
  %70 = load <2 x double>, <2 x double>* %69, align 8
  %71 = fmul <2 x double> %70, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %72 = extractelement <2 x double> %71, i32 0
  %73 = extractelement <2 x double> %71, i32 1
  %74 = fsub double %73, %72
  %75 = load double, double* %62, align 8
  %76 = fmul double %75, 0xC08F400000000001
  %77 = fsub double %74, %76
  %78 = fmul double %store_forwarded66, 0xC09F400000000001
  %79 = fsub double %77, %78
  %80 = fdiv double %79, %67
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv42
  store double %80, double* %81, align 8
  %exitcond = icmp eq i64 %indvars.iv42, 998
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br i1 %exitcond, label %._crit_edge.us.loopexit2, label %59

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit2:                         ; preds = %59
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit2, %._crit_edge.us.loopexit
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv46
  store double 1.000000e+00, double* %82, align 8
  br label %.lr.ph25.us

.lver.check81:                                    ; preds = %._crit_edge34.us, %.lver.check81.preheader
  %indvar67 = phi i64 [ %indvar.next68, %._crit_edge34.us ], [ 0, %.lver.check81.preheader ]
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge34.us ], [ 1, %.lver.check81.preheader ]
  %83 = add nuw nsw i64 %indvar67, 1
  %84 = add nuw nsw i64 %indvar67, 1
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %2, i64 %84, i64 0
  %scevgep71 = getelementptr [1000 x double], [1000 x double]* %2, i64 %84, i64 999
  %scevgep73 = getelementptr [1000 x double], [1000 x double]* %3, i64 %84, i64 0
  %scevgep75 = getelementptr [1000 x double], [1000 x double]* %3, i64 %84, i64 999
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv54, i64 0
  store double 1.000000e+00, double* %85, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv54, i64 0
  store double 0.000000e+00, double* %86, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv54
  %88 = bitcast [1000 x double]* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv54
  %91 = bitcast [1000 x double]* %90 to i64*
  store i64 %89, i64* %91, align 8
  %92 = add nsw i64 %indvars.iv54, -1
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %bound077 = icmp ult double* %scevgep69, %scevgep75
  %bound178 = icmp ult double* %scevgep73, %scevgep71
  %memcheck.conflict80 = and i1 %bound077, %bound178
  br i1 %memcheck.conflict80, label %.ph82.lver.orig.preheader, label %.ph82

.ph82.lver.orig.preheader:                        ; preds = %.lver.check81
  br label %.ph82.lver.orig

.ph82.lver.orig:                                  ; preds = %.ph82.lver.orig.preheader, %.ph82.lver.orig
  %indvars.iv48.lver.orig = phi i64 [ %indvars.iv.next49.lver.orig, %.ph82.lver.orig ], [ 1, %.ph82.lver.orig.preheader ]
  %93 = add nsw i64 %indvars.iv48.lver.orig, -1
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv54, i64 %93
  %95 = load double, double* %94, align 8
  %96 = fmul double %95, 0xC08F400000000001
  %97 = fadd double %96, 0x409F440000000001
  %98 = fdiv double 0x408F400000000001, %97
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv54, i64 %indvars.iv48.lver.orig
  store double %98, double* %99, align 8
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %92, i64 %indvars.iv48.lver.orig
  %101 = load double, double* %100, align 8
  %102 = fmul double %101, 0xC09F400000000001
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv48.lver.orig
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, 0xC0AF3E0000000001
  %106 = fsub double %105, %102
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv48.lver.orig
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, 0xC09F400000000001
  %110 = fsub double %106, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv54, i64 %93
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, 0xC08F400000000001
  %114 = fsub double %110, %113
  %115 = fdiv double %114, %97
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv54, i64 %indvars.iv48.lver.orig
  store double %115, double* %116, align 8
  %exitcond51.lver.orig = icmp eq i64 %indvars.iv48.lver.orig, 998
  %indvars.iv.next49.lver.orig = add nuw nsw i64 %indvars.iv48.lver.orig, 1
  br i1 %exitcond51.lver.orig, label %._crit_edge31.us.loopexit, label %.ph82.lver.orig

.ph82:                                            ; preds = %.lver.check81
  %scevgep86 = getelementptr [1000 x double], [1000 x double]* %3, i64 %83, i64 0
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %2, i64 %83, i64 0
  %load_initial84 = load double, double* %scevgep83, align 8
  %load_initial87 = load double, double* %scevgep86, align 8
  br label %135

._crit_edge34.us:                                 ; preds = %.lr.ph33.us
  %indvar.next68 = add nuw nsw i64 %indvar67, 1
  %exitcond4 = icmp eq i64 %indvar.next68, 998
  br i1 %exitcond4, label %._crit_edge36, label %.lver.check81

.lr.ph33.us:                                      ; preds = %.lr.ph33.us, %._crit_edge31.us
  %indvars.iv52 = phi i64 [ 998, %._crit_edge31.us ], [ %indvars.iv.next53.1, %.lr.ph33.us ]
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv54, i64 %indvars.iv52
  %118 = load double, double* %117, align 8
  %119 = or i64 %indvars.iv52, 1
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv54, i64 %119
  %121 = load double, double* %120, align 8
  %122 = fmul double %118, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv54, i64 %indvars.iv52
  %124 = load double, double* %123, align 8
  %125 = fadd double %122, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv54, i64 %indvars.iv52
  store double %125, double* %126, align 8
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, -1
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv54, i64 %indvars.iv.next53
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, %125
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv54, i64 %indvars.iv.next53
  %131 = load double, double* %130, align 8
  %132 = fadd double %129, %131
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv54, i64 %indvars.iv.next53
  store double %132, double* %133, align 8
  %134 = icmp sgt i64 %indvars.iv.next53, 1
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, -2
  br i1 %134, label %.lr.ph33.us, label %._crit_edge34.us

; <label>:135:                                    ; preds = %135, %.ph82
  %store_forwarded88 = phi double [ %load_initial87, %.ph82 ], [ %153, %135 ]
  %store_forwarded85 = phi double [ %load_initial84, %.ph82 ], [ %138, %135 ]
  %indvars.iv48 = phi i64 [ 1, %.ph82 ], [ %indvars.iv.next49, %135 ]
  %136 = fmul double %store_forwarded85, 0xC08F400000000001
  %137 = fadd double %136, 0x409F440000000001
  %138 = fdiv double 0x408F400000000001, %137
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv54, i64 %indvars.iv48
  store double %138, double* %139, align 8
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %92, i64 %indvars.iv48
  %141 = load double, double* %140, align 8
  %142 = fmul double %141, 0xC09F400000000001
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv48
  %144 = load double, double* %143, align 8
  %145 = fmul double %144, 0xC0AF3E0000000001
  %146 = fsub double %145, %142
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv48
  %148 = load double, double* %147, align 8
  %149 = fmul double %148, 0xC09F400000000001
  %150 = fsub double %146, %149
  %151 = fmul double %store_forwarded88, 0xC08F400000000001
  %152 = fsub double %150, %151
  %153 = fdiv double %152, %137
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv54, i64 %indvars.iv48
  store double %153, double* %154, align 8
  %exitcond51 = icmp eq i64 %indvars.iv48, 998
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  br i1 %exitcond51, label %._crit_edge31.us.loopexit1, label %135

._crit_edge31.us.loopexit:                        ; preds = %.ph82.lver.orig
  br label %._crit_edge31.us

._crit_edge31.us.loopexit1:                       ; preds = %135
  br label %._crit_edge31.us

._crit_edge31.us:                                 ; preds = %._crit_edge31.us.loopexit1, %._crit_edge31.us.loopexit
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv54, i64 999
  store double 1.000000e+00, double* %155, align 8
  br label %.lr.ph33.us

._crit_edge36:                                    ; preds = %._crit_edge34.us
  %156 = add nuw nsw i32 %4, 1
  %exitcond5 = icmp eq i32 %156, 501
  br i1 %exitcond5, label %._crit_edge37, label %.preheader22

._crit_edge37:                                    ; preds = %._crit_edge36
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1000 x double]*) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next4, %._crit_edge.us ]
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond1, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
