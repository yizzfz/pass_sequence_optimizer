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
._crit_edge.lr.ph:
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us, %._crit_edge.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge3.us ], [ 0, %._crit_edge.lr.ph ]
  %2 = add nsw i64 %indvars.iv6, 1000
  %3 = trunc i64 %2 to i32
  %4 = trunc i64 %2 to i32
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us, %._crit_edge.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge.us.new ], [ 0, %._crit_edge.us ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  store double %8, double* %9, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = trunc i64 %indvars.iv.next to i32
  %11 = sub i32 %4, %10
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.000000e+03
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %13, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond11.1, label %._crit_edge3.us, label %._crit_edge.us.new

._crit_edge3.us:                                  ; preds = %._crit_edge.us.new
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond, label %._crit_edge5, label %._crit_edge.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge24, %._crit_edge.lr.ph
  %.0325 = phi i32 [ 1, %._crit_edge.lr.ph ], [ %160, %._crit_edge24 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge, %._crit_edge11.us
  %indvar = phi i64 [ 0, %._crit_edge ], [ %indvar.next, %._crit_edge11.us ]
  %indvars.iv29 = phi i64 [ 1, %._crit_edge ], [ %indvars.iv.next30, %._crit_edge11.us ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv29
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv29, -1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %bound0 = icmp ult double* %scevgep, %scevgep55
  %bound1 = icmp ult double* %scevgep53, %scevgep51
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %15
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 0xC09F400000000001
  %19 = fadd double %18, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv.lver.orig
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, 0xC08F400000000001
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv29
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, 0xC09F3C0000000001
  %28 = fsub double %27, %24
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next30
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %28, %31
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %15
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, 0xC09F400000000001
  %36 = fsub double %32, %35
  %37 = load double, double* %16, align 8
  %38 = fmul double %37, 0xC09F400000000001
  %39 = fadd double %38, 0x40AF420000000001
  %40 = fdiv double %36, %39
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv.lver.orig
  store double %40, double* %41, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond45.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond45.lver.orig, label %._crit_edge7.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %load_initial = load double, double* %scevgep57, align 8
  %load_initial61 = load double, double* %scevgep60, align 8
  br label %42

; <label>:42:                                     ; preds = %42, %.ph
  %store_forwarded62 = phi double [ %load_initial61, %.ph ], [ %62, %42 ]
  %store_forwarded59 = phi double [ %load_initial, %.ph ], [ %45, %42 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %42 ]
  %43 = fmul double %store_forwarded59, 0xC09F400000000001
  %44 = fadd double %43, 0x40AF420000000001
  %45 = fdiv double 0x409F400000000001, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv
  store double %45, double* %46, align 8
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, 0xC08F400000000001
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv29
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 0xC09F3C0000000001
  %53 = fsub double %52, %49
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next30
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, 0xC08F400000000001
  %57 = fsub double %53, %56
  %58 = fmul double %store_forwarded62, 0xC09F400000000001
  %59 = fsub double %57, %58
  %60 = fmul double %store_forwarded59, 0xC09F400000000001
  %61 = fadd double %60, 0x40AF420000000001
  %62 = fdiv double %59, %61
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv
  store double %62, double* %63, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond45, label %._crit_edge7.us.loopexit88, label %42

._crit_edge7.us.loopexit:                         ; preds = %.ph.lver.orig
  br label %._crit_edge7.us

._crit_edge7.us.loopexit88:                       ; preds = %42
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit88, %._crit_edge7.us.loopexit
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv29
  store double 1.000000e+00, double* %64, align 8
  br label %.lr.ph10.us

.lr.ph10.us:                                      ; preds = %.lr.ph10.us, %._crit_edge7.us
  %indvars.iv27 = phi i64 [ 998, %._crit_edge7.us ], [ %indvars.iv.next28.1, %.lr.ph10.us ]
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv27
  %66 = load double, double* %65, align 8
  %67 = or i64 %indvars.iv27, 1
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %67, i64 %indvars.iv29
  %69 = load double, double* %68, align 8
  %70 = fmul double %66, %69
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv27
  %72 = load double, double* %71, align 8
  %73 = fadd double %70, %72
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv29
  store double %73, double* %74, align 8
  %indvars.iv.next28 = add nsw i64 %indvars.iv27, -1
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv.next28
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, %73
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv.next28
  %79 = load double, double* %78, align 8
  %80 = fadd double %77, %79
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next28, i64 %indvars.iv29
  store double %80, double* %81, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, -2
  %82 = icmp sgt i64 %indvars.iv.next28, 1
  br i1 %82, label %.lr.ph10.us, label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %.lr.ph10.us
  %exitcond = icmp eq i64 %indvars.iv.next30, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.lver.check77.preheader, label %.lver.check

.lver.check77.preheader:                          ; preds = %._crit_edge11.us
  br label %.lver.check77

.lver.check77:                                    ; preds = %.lver.check77.preheader, %._crit_edge21.us
  %indvar63 = phi i64 [ %indvar.next64, %._crit_edge21.us ], [ 0, %.lver.check77.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge21.us ], [ 1, %.lver.check77.preheader ]
  %83 = add i64 %indvar63, 1
  %84 = add i64 %indvar63, 1
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %4, i64 %84, i64 0
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %4, i64 %84, i64 999
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %5, i64 %84, i64 0
  %scevgep71 = getelementptr [1000 x double], [1000 x double]* %5, i64 %84, i64 999
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 0
  store double 1.000000e+00, double* %85, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %86, align 8
  %87 = bitcast double* %85 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39
  %90 = bitcast [1000 x double]* %89 to i64*
  store i64 %88, i64* %90, align 8
  %91 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound073 = icmp ult double* %scevgep65, %scevgep71
  %bound174 = icmp ult double* %scevgep69, %scevgep67
  %memcheck.conflict76 = and i1 %bound073, %bound174
  br i1 %memcheck.conflict76, label %.ph78.lver.orig.preheader, label %.ph78

.ph78.lver.orig.preheader:                        ; preds = %.lver.check77
  br label %.ph78.lver.orig

.ph78.lver.orig:                                  ; preds = %.ph78.lver.orig.preheader, %.ph78.lver.orig
  %indvars.iv33.lver.orig = phi i64 [ %indvars.iv.next34.lver.orig, %.ph78.lver.orig ], [ 1, %.ph78.lver.orig.preheader ]
  %92 = add nsw i64 %indvars.iv33.lver.orig, -1
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %92
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, 0xC08F400000000001
  %96 = fadd double %95, 0x409F440000000001
  %97 = fdiv double 0x408F400000000001, %96
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  store double %97, double* %98, align 8
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %91, i64 %indvars.iv33.lver.orig
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, 0xC09F400000000001
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  %103 = load double, double* %102, align 8
  %104 = fmul double %103, 0xC0AF3E0000000001
  %105 = fsub double %104, %101
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv33.lver.orig
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, 0xC09F400000000001
  %109 = fsub double %105, %108
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %92
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, 0xC08F400000000001
  %113 = fsub double %109, %112
  %114 = load double, double* %93, align 8
  %115 = fmul double %114, 0xC08F400000000001
  %116 = fadd double %115, 0x409F440000000001
  %117 = fdiv double %113, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  store double %117, double* %118, align 8
  %indvars.iv.next34.lver.orig = add nuw nsw i64 %indvars.iv33.lver.orig, 1
  %exitcond47.lver.orig = icmp eq i64 %indvars.iv.next34.lver.orig, 999
  br i1 %exitcond47.lver.orig, label %._crit_edge17.us.loopexit, label %.ph78.lver.orig

.ph78:                                            ; preds = %.lver.check77
  %scevgep79 = getelementptr [1000 x double], [1000 x double]* %4, i64 %83, i64 0
  %scevgep84 = getelementptr [1000 x double], [1000 x double]* %5, i64 %83, i64 0
  %load_initial80 = load double, double* %scevgep79, align 8
  %load_initial85 = load double, double* %scevgep84, align 8
  br label %119

; <label>:119:                                    ; preds = %119, %.ph78
  %store_forwarded86 = phi double [ %load_initial85, %.ph78 ], [ %139, %119 ]
  %store_forwarded83 = phi double [ %load_initial80, %.ph78 ], [ %122, %119 ]
  %indvars.iv33 = phi i64 [ 1, %.ph78 ], [ %indvars.iv.next34, %119 ]
  %120 = fmul double %store_forwarded83, 0xC08F400000000001
  %121 = fadd double %120, 0x409F440000000001
  %122 = fdiv double 0x408F400000000001, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv33
  store double %122, double* %123, align 8
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %91, i64 %indvars.iv33
  %125 = load double, double* %124, align 8
  %126 = fmul double %125, 0xC09F400000000001
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv33
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, 0xC0AF3E0000000001
  %130 = fsub double %129, %126
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv33
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, 0xC09F400000000001
  %134 = fsub double %130, %133
  %135 = fmul double %store_forwarded86, 0xC08F400000000001
  %136 = fsub double %134, %135
  %137 = fmul double %store_forwarded83, 0xC08F400000000001
  %138 = fadd double %137, 0x409F440000000001
  %139 = fdiv double %136, %138
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv33
  store double %139, double* %140, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next34, 999
  br i1 %exitcond47, label %._crit_edge17.us.loopexit87, label %119

._crit_edge17.us.loopexit:                        ; preds = %.ph78.lver.orig
  br label %._crit_edge17.us

._crit_edge17.us.loopexit87:                      ; preds = %119
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit87, %._crit_edge17.us.loopexit
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 999
  store double 1.000000e+00, double* %141, align 8
  br label %.lr.ph20.us

.lr.ph20.us:                                      ; preds = %.lr.ph20.us, %._crit_edge17.us
  %indvars.iv37 = phi i64 [ 998, %._crit_edge17.us ], [ %indvars.iv.next38.1, %.lr.ph20.us ]
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv37
  %143 = load double, double* %142, align 8
  %144 = or i64 %indvars.iv37, 1
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %144
  %146 = load double, double* %145, align 8
  %147 = fmul double %143, %146
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv37
  %149 = load double, double* %148, align 8
  %150 = fadd double %147, %149
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv37
  store double %150, double* %151, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, -1
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next38
  %153 = load double, double* %152, align 8
  %154 = fmul double %153, %150
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next38
  %156 = load double, double* %155, align 8
  %157 = fadd double %154, %156
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next38
  store double %157, double* %158, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, -2
  %159 = icmp sgt i64 %indvars.iv.next38, 1
  br i1 %159, label %.lr.ph20.us, label %._crit_edge21.us

._crit_edge21.us:                                 ; preds = %.lr.ph20.us
  %exitcond49 = icmp eq i64 %indvars.iv.next40, 999
  %indvar.next64 = add i64 %indvar63, 1
  br i1 %exitcond49, label %._crit_edge24, label %.lver.check77

._crit_edge24:                                    ; preds = %._crit_edge21.us
  %160 = add nuw nsw i32 %.0325, 1
  %exitcond43 = icmp eq i32 %.0325, 500
  br i1 %exitcond43, label %._crit_edge26, label %._crit_edge

._crit_edge26:                                    ; preds = %._crit_edge24
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next8, %._crit_edge4.us ]
  %6 = mul nsw i64 %indvars.iv7, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2.us ], [ 0, %._crit_edge.us ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond12, label %._crit_edge4.us, label %7

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge.us

._crit_edge6:                                     ; preds = %._crit_edge4.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
