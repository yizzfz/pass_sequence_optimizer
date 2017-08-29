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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call void @print_array([1000 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1000 x double]* nocapture) #2 {
.preheader.lr.ph:
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.lr.ph, %._crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %1 = add i64 %indvars.iv6, 1000
  %2 = trunc i64 %1 to i32
  %3 = trunc i64 %1 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us.new
  %indvars.iv = phi i64 [ 0, %.preheader.us.new ], [ %indvars.iv.next.1, %4 ]
  %5 = sub nsw i64 0, %indvars.iv
  %6 = trunc i64 %5 to i32
  %7 = add i32 %2, %6
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  store double %9, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv to i32
  %12 = xor i32 %11, -1
  %13 = add i32 %3, %12
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %15, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond10.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond10.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us.new

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
.preheader4.lr.ph:
  br label %.lr.ph11.split.us.preheader

.lr.ph11.split.us.preheader:                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %159, %._crit_edge22 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us, %.lr.ph11.split.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge9.us ], [ 0, %.lr.ph11.split.us.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 1, %.lr.ph11.split.us.preheader ]
  %4 = add i64 %indvar, 1
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %13
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, 0xC09F400000000001
  %17 = fadd double %16, 0x40AF420000000001
  %18 = fdiv double 0x409F400000000001, %17
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, 0xC08F400000000001
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv27
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, 0xC09F3C0000000001
  %26 = fsub double %25, %22
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %26, %29
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %13
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = fsub double %30, %33
  %35 = load double, double* %14, align 8
  %36 = fmul double %35, 0xC09F400000000001
  %37 = fadd double %36, 0x40AF420000000001
  %38 = fdiv double %34, %37
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %38, double* %39, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond42.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond42.lver.orig, label %.lr.ph8.us.preheader.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %scevgep11 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %load_initial = load double, double* %scevgep8, align 8
  %load_initial12 = load double, double* %scevgep11, align 8
  br label %58

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond = icmp eq i64 %indvars.iv.next28, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.lver.check28.preheader, label %.lver.check

.lver.check28.preheader:                          ; preds = %._crit_edge9.us
  br label %.lver.check28

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %.lr.ph8.us.preheader
  %indvars.iv25 = phi i64 [ 998, %.lr.ph8.us.preheader ], [ %indvars.iv.next26.1, %.lr.ph8.us ]
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv25
  %41 = load double, double* %40, align 8
  %42 = or i64 %indvars.iv25, 1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %42, i64 %indvars.iv27
  %44 = load double, double* %43, align 8
  %45 = fmul double %41, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv25
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv27
  store double %48, double* %49, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv.next26
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %48
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv.next26
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %55, double* %56, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  %57 = icmp sgt i64 %indvars.iv.next26, 1
  br i1 %57, label %.lr.ph8.us, label %._crit_edge9.us

; <label>:58:                                     ; preds = %58, %.ph
  %store_forwarded13 = phi double [ %load_initial12, %.ph ], [ %78, %58 ]
  %store_forwarded10 = phi double [ %load_initial, %.ph ], [ %61, %58 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %58 ]
  %59 = fmul double %store_forwarded10, 0xC09F400000000001
  %60 = fadd double %59, 0x40AF420000000001
  %61 = fdiv double 0x409F400000000001, %60
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv
  store double %61, double* %62, align 8
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, 0xC08F400000000001
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv27
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, 0xC09F3C0000000001
  %69 = fsub double %68, %65
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next28
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, 0xC08F400000000001
  %73 = fsub double %69, %72
  %74 = fmul double %store_forwarded13, 0xC09F400000000001
  %75 = fsub double %73, %74
  %76 = fmul double %store_forwarded10, 0xC09F400000000001
  %77 = fadd double %76, 0x40AF420000000001
  %78 = fdiv double %75, %77
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv
  store double %78, double* %79, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond42, label %.lr.ph8.us.preheader.loopexit39, label %58

.lr.ph8.us.preheader.loopexit:                    ; preds = %.ph.lver.orig
  br label %.lr.ph8.us.preheader

.lr.ph8.us.preheader.loopexit39:                  ; preds = %58
  br label %.lr.ph8.us.preheader

.lr.ph8.us.preheader:                             ; preds = %.lr.ph8.us.preheader.loopexit39, %.lr.ph8.us.preheader.loopexit
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv27
  store double 1.000000e+00, double* %80, align 8
  br label %.lr.ph8.us

.lver.check28:                                    ; preds = %.lver.check28.preheader, %._crit_edge19.us
  %indvar14 = phi i64 [ %indvar.next15, %._crit_edge19.us ], [ 0, %.lver.check28.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 1, %.lver.check28.preheader ]
  %81 = add i64 %indvar14, 1
  %82 = add i64 %indvar14, 1
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %82, i64 0
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %2, i64 %82, i64 999
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %82, i64 0
  %scevgep22 = getelementptr [1000 x double], [1000 x double]* %3, i64 %82, i64 999
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 0, i64 0
  store double 1.000000e+00, double* %84, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 0
  store double 0.000000e+00, double* %85, align 8
  %86 = bitcast [1000 x double]* %83 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37
  %89 = bitcast [1000 x double]* %88 to i64*
  store i64 %87, i64* %89, align 8
  %90 = add nsw i64 %indvars.iv37, -1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %bound024 = icmp ult double* %scevgep16, %scevgep22
  %bound125 = icmp ult double* %scevgep20, %scevgep18
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %.ph29.lver.orig.preheader, label %.ph29

.ph29.lver.orig.preheader:                        ; preds = %.lver.check28
  br label %.ph29.lver.orig

.ph29.lver.orig:                                  ; preds = %.ph29.lver.orig.preheader, %.ph29.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %.ph29.lver.orig ], [ 1, %.ph29.lver.orig.preheader ]
  %91 = add nsw i64 %indvars.iv31.lver.orig, -1
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %91
  %93 = load double, double* %92, align 8
  %94 = fmul double %93, 0xC08F400000000001
  %95 = fadd double %94, 0x409F440000000001
  %96 = fdiv double 0x408F400000000001, %95
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %96, double* %97, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %90, i64 %indvars.iv31.lver.orig
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, 0xC09F400000000001
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, 0xC0AF3E0000000001
  %104 = fsub double %103, %100
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next38, i64 %indvars.iv31.lver.orig
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, 0xC09F400000000001
  %108 = fsub double %104, %107
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %91
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, 0xC08F400000000001
  %112 = fsub double %108, %111
  %113 = load double, double* %92, align 8
  %114 = fmul double %113, 0xC08F400000000001
  %115 = fadd double %114, 0x409F440000000001
  %116 = fdiv double %112, %115
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %116, double* %117, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond43.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, 999
  br i1 %exitcond43.lver.orig, label %.lr.ph18.us.preheader.loopexit, label %.ph29.lver.orig

.ph29:                                            ; preds = %.lver.check28
  %scevgep30 = getelementptr [1000 x double], [1000 x double]* %2, i64 %81, i64 0
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %3, i64 %81, i64 0
  %load_initial31 = load double, double* %scevgep30, align 8
  %load_initial36 = load double, double* %scevgep35, align 8
  br label %136

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond44 = icmp eq i64 %indvars.iv.next38, 999
  %indvar.next15 = add i64 %indvar14, 1
  br i1 %exitcond44, label %._crit_edge22, label %.lver.check28

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %.lr.ph18.us.preheader
  %indvars.iv35 = phi i64 [ 998, %.lr.ph18.us.preheader ], [ %indvars.iv.next36.1, %.lr.ph18.us ]
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv35
  %119 = load double, double* %118, align 8
  %120 = or i64 %indvars.iv35, 1
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %120
  %122 = load double, double* %121, align 8
  %123 = fmul double %119, %122
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv35
  %125 = load double, double* %124, align 8
  %126 = fadd double %123, %125
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv35
  store double %126, double* %127, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next36
  %129 = load double, double* %128, align 8
  %130 = fmul double %129, %126
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next36
  %132 = load double, double* %131, align 8
  %133 = fadd double %130, %132
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv.next36
  store double %133, double* %134, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  %135 = icmp sgt i64 %indvars.iv.next36, 1
  br i1 %135, label %.lr.ph18.us, label %._crit_edge19.us

; <label>:136:                                    ; preds = %136, %.ph29
  %store_forwarded37 = phi double [ %load_initial36, %.ph29 ], [ %156, %136 ]
  %store_forwarded34 = phi double [ %load_initial31, %.ph29 ], [ %139, %136 ]
  %indvars.iv31 = phi i64 [ 1, %.ph29 ], [ %indvars.iv.next32, %136 ]
  %137 = fmul double %store_forwarded34, 0xC08F400000000001
  %138 = fadd double %137, 0x409F440000000001
  %139 = fdiv double 0x408F400000000001, %138
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv31
  store double %139, double* %140, align 8
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %90, i64 %indvars.iv31
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, 0xC09F400000000001
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv31
  %145 = load double, double* %144, align 8
  %146 = fmul double %145, 0xC0AF3E0000000001
  %147 = fsub double %146, %143
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next38, i64 %indvars.iv31
  %149 = load double, double* %148, align 8
  %150 = fmul double %149, 0xC09F400000000001
  %151 = fsub double %147, %150
  %152 = fmul double %store_forwarded37, 0xC08F400000000001
  %153 = fsub double %151, %152
  %154 = fmul double %store_forwarded34, 0xC08F400000000001
  %155 = fadd double %154, 0x409F440000000001
  %156 = fdiv double %153, %155
  %157 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31
  store double %156, double* %157, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond43, label %.lr.ph18.us.preheader.loopexit38, label %136

.lr.ph18.us.preheader.loopexit:                   ; preds = %.ph29.lver.orig
  br label %.lr.ph18.us.preheader

.lr.ph18.us.preheader.loopexit38:                 ; preds = %136
  br label %.lr.ph18.us.preheader

.lr.ph18.us.preheader:                            ; preds = %.lr.ph18.us.preheader.loopexit38, %.lr.ph18.us.preheader.loopexit
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 999
  store double 1.000000e+00, double* %158, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %159 = add nuw nsw i32 %.0323, 1
  %exitcond41 = icmp eq i32 %.0323, 500
  br i1 %exitcond41, label %._crit_edge24, label %.lr.ph11.split.us.preheader

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1000 x double]* nocapture readonly) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv5, 1000
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %13 ]
  %7 = add nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond9, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
