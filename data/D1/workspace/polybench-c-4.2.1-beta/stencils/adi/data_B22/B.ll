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
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
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
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %14, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %14 ]
  %3 = add nuw nsw i64 %indvars.iv4, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %4 = sub nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  store double %7, double* %8, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = sub nuw nsw i64 %3, %indvars.iv.next
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %12, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond, label %15, label %._crit_edge.preheader

; <label>:15:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %6, %._crit_edge4._crit_edge
  %.0318 = phi i32 [ 1, %6 ], [ %152, %._crit_edge4._crit_edge ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge.us, %._crit_edge.preheader
  %indvar = phi i64 [ %7, %._crit_edge.us ], [ 0, %._crit_edge.preheader ]
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge.us ], [ 1, %._crit_edge.preheader ]
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep34 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep36 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep38 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv21
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv21, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv21, -1
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %bound0 = icmp ult double* %scevgep, %scevgep38
  %bound1 = icmp ult double* %scevgep36, %scevgep34
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv21, i64 %15
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 0xC09F400000000001
  %19 = fadd double %18, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv21, i64 %indvars.iv.lver.orig
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, 0xC08F400000000001
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv21
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, 0xC09F3C0000000001
  %28 = fsub double %27, %24
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next22
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %28, %31
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %15
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, 0xC09F400000000001
  %36 = fsub double %32, %35
  %37 = fdiv double %36, %19
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv.lver.orig
  store double %37, double* %38, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge7.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial44 = load double, double* %scevgep36, align 8
  br label %58

._crit_edge.us:                                   ; preds = %39
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 999
  br i1 %exitcond23, label %.lver.check60.preheader, label %.lver.check

.lver.check60.preheader:                          ; preds = %._crit_edge.us
  br label %.lver.check60

; <label>:39:                                     ; preds = %39, %._crit_edge7.us
  %indvars.iv19 = phi i64 [ 998, %._crit_edge7.us ], [ %indvars.iv.next20.1, %39 ]
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv21, i64 %indvars.iv19
  %41 = load double, double* %40, align 8
  %42 = or i64 %indvars.iv19, 1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %42, i64 %indvars.iv21
  %44 = load double, double* %43, align 8
  %45 = fmul double %41, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv19
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv21
  store double %48, double* %49, align 8
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, -1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv21, i64 %indvars.iv.next20
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %48
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv.next20
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next20, i64 %indvars.iv21
  store double %55, double* %56, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, -2
  %57 = icmp sgt i64 %indvars.iv.next20, 1
  br i1 %57, label %39, label %._crit_edge.us

; <label>:58:                                     ; preds = %58, %.ph
  %store_forwarded45 = phi double [ %load_initial44, %.ph ], [ %76, %58 ]
  %store_forwarded42 = phi double [ %load_initial, %.ph ], [ %61, %58 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %58 ]
  %59 = fmul double %store_forwarded42, 0xC09F400000000001
  %60 = fadd double %59, 0x40AF420000000001
  %61 = fdiv double 0x409F400000000001, %60
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv21, i64 %indvars.iv
  store double %61, double* %62, align 8
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, 0xC08F400000000001
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv21
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, 0xC09F3C0000000001
  %69 = fsub double %68, %65
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next22
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, 0xC08F400000000001
  %73 = fsub double %69, %72
  %74 = fmul double %store_forwarded45, 0xC09F400000000001
  %75 = fsub double %73, %74
  %76 = fdiv double %75, %60
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv
  store double %76, double* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge7.us.loopexit71, label %58

._crit_edge7.us.loopexit:                         ; preds = %.ph.lver.orig
  br label %._crit_edge7.us

._crit_edge7.us.loopexit71:                       ; preds = %58
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit71, %._crit_edge7.us.loopexit
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv21
  store double 1.000000e+00, double* %78, align 8
  br label %39

.lver.check60:                                    ; preds = %.lver.check60.preheader, %._crit_edge4.us
  %indvar46 = phi i64 [ %79, %._crit_edge4.us ], [ 0, %.lver.check60.preheader ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge4.us ], [ 1, %.lver.check60.preheader ]
  %79 = add i64 %indvar46, 1
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 0
  %scevgep50 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 999
  %scevgep52 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 0
  %scevgep54 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 999
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 0, i64 0
  store double 1.000000e+00, double* %81, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 0
  store double 0.000000e+00, double* %82, align 8
  %83 = bitcast [1000 x double]* %80 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29
  %86 = bitcast [1000 x double]* %85 to i64*
  store i64 %84, i64* %86, align 8
  %87 = add nsw i64 %indvars.iv29, -1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %bound056 = icmp ult double* %scevgep48, %scevgep54
  %bound157 = icmp ult double* %scevgep52, %scevgep50
  %memcheck.conflict59 = and i1 %bound056, %bound157
  br i1 %memcheck.conflict59, label %.ph61.lver.orig.preheader, label %.ph61

.ph61.lver.orig.preheader:                        ; preds = %.lver.check60
  br label %.ph61.lver.orig

.ph61.lver.orig:                                  ; preds = %.ph61.lver.orig.preheader, %.ph61.lver.orig
  %indvars.iv24.lver.orig = phi i64 [ %indvars.iv.next25.lver.orig, %.ph61.lver.orig ], [ 1, %.ph61.lver.orig.preheader ]
  %88 = add nsw i64 %indvars.iv24.lver.orig, -1
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %88
  %90 = load double, double* %89, align 8
  %91 = fmul double %90, 0xC08F400000000001
  %92 = fadd double %91, 0x409F440000000001
  %93 = fdiv double 0x408F400000000001, %92
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv24.lver.orig
  store double %93, double* %94, align 8
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv24.lver.orig
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, 0xC09F400000000001
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv24.lver.orig
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, 0xC0AF3E0000000001
  %101 = fsub double %100, %97
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next30, i64 %indvars.iv24.lver.orig
  %103 = load double, double* %102, align 8
  %104 = fmul double %103, 0xC09F400000000001
  %105 = fsub double %101, %104
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %88
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, 0xC08F400000000001
  %109 = fsub double %105, %108
  %110 = fdiv double %109, %92
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv24.lver.orig
  store double %110, double* %111, align 8
  %indvars.iv.next25.lver.orig = add nuw nsw i64 %indvars.iv24.lver.orig, 1
  %exitcond26.lver.orig = icmp eq i64 %indvars.iv.next25.lver.orig, 999
  br i1 %exitcond26.lver.orig, label %._crit_edge14.us.loopexit, label %.ph61.lver.orig

.ph61:                                            ; preds = %.lver.check60
  %load_initial63 = load double, double* %scevgep48, align 8
  %load_initial68 = load double, double* %scevgep52, align 8
  br label %131

._crit_edge4.us:                                  ; preds = %112
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 999
  br i1 %exitcond31, label %._crit_edge4._crit_edge, label %.lver.check60

; <label>:112:                                    ; preds = %112, %._crit_edge14.us
  %indvars.iv27 = phi i64 [ 998, %._crit_edge14.us ], [ %indvars.iv.next28.1, %112 ]
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv27
  %114 = load double, double* %113, align 8
  %115 = or i64 %indvars.iv27, 1
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 %115
  %117 = load double, double* %116, align 8
  %118 = fmul double %114, %117
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv27
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv27
  store double %121, double* %122, align 8
  %indvars.iv.next28 = add nsw i64 %indvars.iv27, -1
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv.next28
  %124 = load double, double* %123, align 8
  %125 = fmul double %124, %121
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv.next28
  %127 = load double, double* %126, align 8
  %128 = fadd double %125, %127
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next28
  store double %128, double* %129, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, -2
  %130 = icmp sgt i64 %indvars.iv.next28, 1
  br i1 %130, label %112, label %._crit_edge4.us

; <label>:131:                                    ; preds = %131, %.ph61
  %store_forwarded69 = phi double [ %load_initial68, %.ph61 ], [ %149, %131 ]
  %store_forwarded66 = phi double [ %load_initial63, %.ph61 ], [ %134, %131 ]
  %indvars.iv24 = phi i64 [ 1, %.ph61 ], [ %indvars.iv.next25, %131 ]
  %132 = fmul double %store_forwarded66, 0xC08F400000000001
  %133 = fadd double %132, 0x409F440000000001
  %134 = fdiv double 0x408F400000000001, %133
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv24
  store double %134, double* %135, align 8
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv24
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, 0xC09F400000000001
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv24
  %140 = load double, double* %139, align 8
  %141 = fmul double %140, 0xC0AF3E0000000001
  %142 = fsub double %141, %138
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next30, i64 %indvars.iv24
  %144 = load double, double* %143, align 8
  %145 = fmul double %144, 0xC09F400000000001
  %146 = fsub double %142, %145
  %147 = fmul double %store_forwarded69, 0xC08F400000000001
  %148 = fsub double %146, %147
  %149 = fdiv double %148, %133
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv24
  store double %149, double* %150, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 999
  br i1 %exitcond26, label %._crit_edge14.us.loopexit70, label %131

._crit_edge14.us.loopexit:                        ; preds = %.ph61.lver.orig
  br label %._crit_edge14.us

._crit_edge14.us.loopexit70:                      ; preds = %131
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit70, %._crit_edge14.us.loopexit
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 999
  store double 1.000000e+00, double* %151, align 8
  br label %112

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4.us
  %152 = add nuw nsw i32 %.0318, 1
  %exitcond32 = icmp eq i32 %152, 501
  br i1 %exitcond32, label %153, label %._crit_edge.preheader

; <label>:153:                                    ; preds = %._crit_edge4._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %19, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next6, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %20, label %._crit_edge.preheader

; <label>:20:                                     ; preds = %19
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
